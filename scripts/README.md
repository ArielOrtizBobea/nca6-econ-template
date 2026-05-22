# Scripts

Helper scripts for NCA6 coauthors.

## `sync-shared-bib.sh`

Pulls the canonical NCA6 shared bibliography from a configured URL and merges it into your local `Bibliography_base.bib`.

### When to run

- After cloning the template (to seed shared core entries you don't already have)
- Periodically as the canonical bib gets updated by the lead coauthor or core team

### Usage

```bash
# Default — uses the URL configured inside the script
./scripts/sync-shared-bib.sh

# Override URL (useful before the canonical URL is set)
./scripts/sync-shared-bib.sh --url https://example.com/path/to/shared.bib

# See what would change without applying
./scripts/sync-shared-bib.sh --dry-run
```

### What it does

1. Fetches the upstream bib via `curl`.
2. Identifies keys present upstream that are NOT in your local bib → these will be appended (tagged with `% SHARED-CORE`).
3. Identifies conflicts (same key, present in both) → reports them but does NOT auto-resolve. You decide which version to keep.
4. Appends new shared entries to the end of `Bibliography_base.bib` with a timestamp comment.

The script is idempotent — running twice produces the same result as running once.

### Configuration TODO

The default URL inside the script is a placeholder (`REPLACE-ME`). The lead coauthor needs to set it once a hosting decision is made. Hosting options:

- **Separate public GitHub repo** (e.g., `nca6-econ-shared-bib`) — versionable, transparent, easy to PR additions
- **This template repo** as canonical — `Bibliography_base.bib` here is the source of truth, coauthors pull via `git`
- **Zotero group library** — export to a stable raw URL periodically

Until the URL is set, pass `--url` on the command line each time.

### Reconciling conflicts

If the script reports conflicting keys, open `Bibliography_base.bib` and the upstream version side-by-side, decide which to keep, edit your local copy, and re-run the script.

### Adding your own entries

Add BibTeX entries directly to `Bibliography_base.bib`. The script never touches entries it didn't add (it only appends new shared-core entries). Your own additions are safe across syncs.
