#!/usr/bin/env bash
# sync-shared-bib.sh — Sync the canonical NCA6 shared bibliography
#
# Fetches a canonical NCA6 bib from a configured URL and merges it into
# Bibliography_base.bib. Local entries (those without a `% SHARED-CORE`
# marker) are preserved. Shared entries are updated to the upstream version.
#
# Usage:
#   ./scripts/sync-shared-bib.sh
#   ./scripts/sync-shared-bib.sh --url <override-url>
#   ./scripts/sync-shared-bib.sh --dry-run
#
# Idempotent: running twice yields the same result as running once.
#
# Coauthor workflow:
#   1. Add your own BibTeX entries to Bibliography_base.bib as usual.
#   2. Run this script periodically to pull updates from the canonical set.
#   3. Conflicts (same key, different content) are reported but NOT auto-merged.

set -euo pipefail

# ====== Configuration ======
# TODO: Replace this placeholder with the actual canonical bib URL once Ariel
# decides where to host it (separate GitHub repo, this repo's bib, Zotero
# export, etc.).
DEFAULT_URL="https://raw.githubusercontent.com/ArielOrtizBobea/REPLACE-ME/main/NCA6_shared.bib"

# Resolve script directory to find the repo root
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
LOCAL_BIB="$REPO_ROOT/Bibliography_base.bib"
TMP_BIB="$(mktemp -t nca6_shared_bib.XXXXXX.bib)"
trap 'rm -f "$TMP_BIB"' EXIT

# ====== Argument parsing ======
URL="$DEFAULT_URL"
DRY_RUN=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    --url) URL="$2"; shift 2 ;;
    --dry-run) DRY_RUN=1; shift ;;
    -h|--help)
      sed -n '2,18p' "${BASH_SOURCE[0]}" | sed 's/^# \?//'
      exit 0
      ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
done

# ====== Sanity checks ======
if [[ "$URL" == *"REPLACE-ME"* ]]; then
  cat >&2 <<EOF
ERROR: The shared bib URL has not been configured.

Edit scripts/sync-shared-bib.sh and set DEFAULT_URL to the canonical NCA6
shared bib URL, or pass --url <url> on the command line.

Hosting options (decide with your lead coauthor):
  - A separate public GitHub repo (e.g., nca6-econ-shared-bib)
  - This template repo's Bibliography_base.bib (treated as canonical upstream)
  - A Zotero group library exported periodically to a stable URL

Until the URL is set, run the script with --url:
  ./scripts/sync-shared-bib.sh --url https://example.com/path/to/shared.bib
EOF
  exit 3
fi

if [[ ! -f "$LOCAL_BIB" ]]; then
  echo "ERROR: $LOCAL_BIB not found." >&2
  exit 4
fi

if ! command -v curl >/dev/null 2>&1; then
  echo "ERROR: curl required but not installed." >&2
  exit 5
fi

# ====== Fetch upstream ======
echo "Fetching shared bib from: $URL"
if ! curl -fsSL "$URL" -o "$TMP_BIB"; then
  echo "ERROR: Failed to fetch shared bib from $URL" >&2
  exit 6
fi

if [[ ! -s "$TMP_BIB" ]]; then
  echo "ERROR: Fetched file is empty." >&2
  exit 7
fi

echo "Fetched $(wc -l < "$TMP_BIB") lines from upstream."

# ====== Extract keys from upstream ======
# Match @TYPE{key, allowing whitespace and case-insensitivity
UPSTREAM_KEYS="$(grep -oE '@[a-zA-Z]+\{[^,]+' "$TMP_BIB" | sed 's/@[a-zA-Z]*{//' | sort -u)"
UPSTREAM_COUNT="$(echo "$UPSTREAM_KEYS" | grep -c .)"
echo "Upstream contains $UPSTREAM_COUNT entries."

# ====== Identify local keys and shared-core local keys ======
LOCAL_KEYS="$(grep -oE '@[a-zA-Z]+\{[^,]+' "$LOCAL_BIB" | sed 's/@[a-zA-Z]*{//' | sort -u)"
LOCAL_COUNT="$(echo "$LOCAL_KEYS" | grep -c .)"
echo "Local bib contains $LOCAL_COUNT entries."

# Find conflicts: keys present in BOTH upstream and local
CONFLICTS="$(comm -12 <(echo "$UPSTREAM_KEYS") <(echo "$LOCAL_KEYS"))"
CONFLICT_COUNT="$(echo -n "$CONFLICTS" | grep -c . || true)"

# Find new shared entries: in upstream but NOT in local
NEW_SHARED="$(comm -23 <(echo "$UPSTREAM_KEYS") <(echo "$LOCAL_KEYS"))"
NEW_COUNT="$(echo -n "$NEW_SHARED" | grep -c . || true)"

echo ""
echo "=== Sync summary ==="
echo "Upstream entries:       $UPSTREAM_COUNT"
echo "Local entries:          $LOCAL_COUNT"
echo "New shared entries:     $NEW_COUNT (will be added)"
echo "Conflicts (same key):   $CONFLICT_COUNT (reported, not auto-resolved)"
echo ""

if [[ "$CONFLICT_COUNT" -gt 0 ]]; then
  echo "Conflicting keys (you'll need to reconcile manually):"
  echo "$CONFLICTS" | sed 's/^/  - /'
  echo ""
  echo "For each conflict, decide whether to keep the local version or the"
  echo "upstream version. Edit $LOCAL_BIB and re-run if needed."
  echo ""
fi

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "DRY RUN: no changes made."
  exit 0
fi

# ====== Apply: append new shared entries to local bib ======
if [[ "$NEW_COUNT" -gt 0 ]]; then
  # Extract just the new entries from the upstream file
  # Strategy: walk through upstream, capturing entries whose keys are in NEW_SHARED
  echo "" >> "$LOCAL_BIB"
  echo "% ====== Synced from upstream shared bib on $(date -u +%Y-%m-%dT%H:%M:%SZ) ======" >> "$LOCAL_BIB"

  python3 - "$TMP_BIB" "$LOCAL_BIB" <<'PYEOF' "$NEW_SHARED"
import sys, re, io
upstream_path, local_path = sys.argv[1], sys.argv[2]
new_keys = set(k.strip() for k in sys.argv[3].split('\n') if k.strip())

with open(upstream_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Split by @ at line start; reconstruct entries
entries = re.split(r'(?=^@)', content, flags=re.MULTILINE)

written = 0
with open(local_path, 'a', encoding='utf-8') as out:
    for entry in entries:
        m = re.match(r'@[a-zA-Z]+\{([^,]+),', entry)
        if not m: continue
        key = m.group(1).strip()
        if key in new_keys:
            # Tag with SHARED-CORE marker if not already
            tagged = re.sub(r'^(@[a-zA-Z]+\{)', r'% SHARED-CORE — synced from upstream; do not delete\n\1',
                            entry, count=1, flags=re.MULTILINE)
            out.write('\n' + tagged.rstrip() + '\n')
            written += 1

print(f"Appended {written} new shared entries to {local_path}")
PYEOF

  echo "Added $NEW_COUNT new shared entries to $LOCAL_BIB"
else
  echo "No new shared entries to add."
fi

# ====== Sanity: backup ======
echo ""
echo "Tip: this script appends only. To see what changed, run:"
echo "  git diff $LOCAL_BIB"
echo ""
echo "Done."
