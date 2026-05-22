# Anchor Mode — Bridge Literature Search

> Loaded on demand by `discover/SKILL.md` when the user invokes `/discover anchor`. This file holds the full protocol for orchestrating the Librarian in Bridge Anchor Mode.

---

## When to use this mode

A coauthor is contributing an economics-perspective section to an NCA6 chapter. They have a subfield (labor, health, trade, public, IO, macro, development, environmental, finance) and a chosen climate-economics slice. They need a literature search that *bridges* their subfield to climate-economics — using NCA5 / IPCC AR6 / coauthor-supplied review documents as anchors.

If no `aspect_spec_[coauthor].md` exists in `quality_reports/`, the coauthor needs to run `/discover interview` first. Halt and tell them so.

---

## Pre-flight checks (do these first, in this order)

1. **Aspect spec exists?** Look for `quality_reports/aspect_spec_*.md`. If multiple, take the most recently modified, but report which one you're using. If none, stop and tell the coauthor:
   > No aspect spec found. Run `/discover interview` first — that elicits your subfield and chosen climate-economics slice and saves it to `quality_reports/aspect_spec_[coauthor].md`. Then re-run `/discover anchor`.

2. **Anchor index exists?** Read `master_supporting_docs/anchors/anchor-index.md`. If missing, halt and tell the coauthor the template is misconfigured (this file ships pre-populated).

3. **Domain profile exists?** Read `.claude/references/domain-profile.md` for the Bridge Reference Table and NCA confidence/likelihood vocabulary.

4. **Bibliography exists?** Read `Bibliography_base.bib` to know what citations the coauthor already has — don't re-add entries with matching keys.

---

## Orchestration

This skill dispatches the **Librarian** in Bridge Anchor Mode (see `.claude/agents/librarian.md`, section "Bridge Anchor Mode"). Then dispatches **librarian-critic** to score the output. Standard worker-critic pair.

### Dispatch prompt for Librarian

Pass the Librarian a structured task:

```
You are operating in Bridge Anchor Mode.

INPUTS (paths the user has confirmed exist):
- Aspect spec: quality_reports/aspect_spec_[coauthor].md
- Anchor index: master_supporting_docs/anchors/anchor-index.md
- Domain profile: .claude/references/domain-profile.md
- Existing bibliography: Bibliography_base.bib

TASK: Follow the Bridge Anchor Mode protocol in your agent definition.

OUTPUT TO: quality_reports/literature/[coauthor]/

REQUIRED FILES:
- bridge_review.md
- references.bib
- staleness_flags.md
- adjacent_surfacing.md
- frontier_map.md
- positioning.md

CONSTRAINTS:
- Cite no paper you cannot verify. Mark unverified BibTeX entries with % UNVERIFIED.
- Every paper must carry a Bridge tag and a Subfield concept.
- Organize bridge_review.md by anchor section, not by generic journal categories.
- If an anchor URL cannot be fetched, note the gap explicitly and proceed with remaining anchors.
- If the aspect spec ambiguous, pick a defensible reading and document it in positioning.md.
```

### After Librarian returns

1. Verify the six output files exist at `quality_reports/literature/[coauthor]/`. If any are missing, report and re-dispatch with a list of missing files (max 1 retry).
2. Dispatch the librarian-critic on the Mode B checks (items 6–9 in its agent file).
3. If the critic's score is < 80, return both the bibliography and the critic's report to the coauthor, suggest specific fixes, and ask whether to re-run.
4. If the score is >= 80, summarize: how many anchors used, how many papers surfaced (by status: SEED / NEW / CONFIRMED / EXTENDED / CONTESTED / OPEN / ADJACENT), what's stale, what's open.

---

## Anchor weighting heuristic

The Librarian decides anchor weights, but here's the guide it should follow (also documented in the Bridge Reference Table in `domain-profile.md`):

| Coauthor subfield | High-weight anchors |
|-------------------|---------------------|
| Labor | NCA5 Ch.19 (labor sections); IPCC AR6 WG2 Ch.16 (labor risks) |
| Health | NCA5 Ch.19 (health & welfare valuation); IPCC AR6 WG2 Ch.16 |
| Trade | IPCC AR6 WG3 Ch.13 (cross-border policy); WG3 Ch.15 (finance flows) |
| Public / policy | IPCC AR6 WG3 Ch.13 (national/sub-national policies); NCA5 Ch.19 |
| IO / regulation | IPCC AR6 WG3 Ch.13; IPCC AR6 WG3 Ch.15 (sectoral) |
| Macro | IPCC AR6 WG3 Ch.3 (mitigation pathways, IAMs); NCA5 Ch.19 (aggregate impacts) |
| Development | IPCC AR6 WG2 Ch.16 (regional risk); SR1.5; NCA5 Ch.19 (cross-region) |
| Environmental | NCA5 Ch.19; IPCC AR6 WG2 Ch.16; WG3 Ch.3 |
| Finance | IPCC AR6 WG3 Ch.15 (investment, capital flows, transition risk) |

The coauthor's own supplied anchors (in the "Coauthor-Supplied Anchors" section of `anchor-index.md`) should generally be weighted highest — they were chosen as most-relevant by the coauthor.

---

## Output format conventions

### `bridge_review.md` structure

```markdown
# Bridge Literature Review — [Coauthor Name]
**Subfield:** [labor / health / ...]
**Slice:** [the coauthor's chosen climate-economics topic]
**Anchors used:** [list with weights]
**Date:** YYYY-MM-DD

## Anchor 1: [Title] — weight [1–5]

### [Anchor Section, e.g., "16.5.2 Labor Risks"]

**Seed citations (in this section):**
- Author (Year), full citation — Status: SEED. Bridge tag: [anchor section]. Subfield concept: [...]
- ...

**New since cutoff (post-[year]):**
- Author (Year), full citation — Status: NEW or EXTENDED. Bridge tag: [anchor section]. Subfield concept: [...]. Why included: [one sentence].
- ...

## Anchor 2: [Title] — weight [1–5]
[same structure]

## Adjacent-Subfield Surfacing
(See adjacent_surfacing.md for full list. Summary here.)

## Notes
- Anchors not fetched: [list]
- Ambiguities in aspect spec: [list]
```

### `staleness_flags.md` structure

```markdown
# Staleness Flags — [Coauthor Name]

For each major claim in the anchors that falls in the coauthor's slice:

## Claim 1: [verbatim or paraphrased anchor claim]
**Source:** [Anchor X, Section Y]
**Original confidence (anchor):** [very high / high / medium / low / very low]
**Status:** CONFIRMED | EXTENDED | CONTESTED | OPEN
**Evidence:**
- [Citation] — [one-line statement of how it bears on the claim]
- ...
**Implication for NCA6:** [one sentence — should the new chapter restate, extend, qualify, or reject this claim?]
```

### `adjacent_surfacing.md` structure

```markdown
# Adjacent-Subfield Surfacing — [Coauthor Name]

3–5 papers from adjacent subfields engaging this coauthor's slice that the coauthor may not be tracking.

## [Author (Year)]
**Subfield:** [adjacent subfield]
**Why surfaced:** [the bridge — what about this paper engages the coauthor's slice]
**How to use it:** [one sentence on integration into the contribution]
```

---

## Failure modes to avoid

- **Anchor-hugging.** All papers come from the anchors' own bibliographies; no post-cutoff papers; no subfield-native climate work. → librarian-critic will deduct for forward-citation gap.
- **Subfield-blind.** Output reads as a generic NCA5 update — no subfield filter applied. → librarian-critic will deduct for "aspect spec ignored."
- **Cross-bridge drift.** Output includes generic subfield papers with no climate content, or generic climate papers with no subfield engagement. → librarian-critic will deduct for "off-bridge papers."
- **Fabricated citations.** Hallucinated DOIs, made-up author lists. → marked UNVERIFIED is fine; fabrication is not.
- **Missing staleness check.** No engagement with anchor claims, just a bibliography. → librarian-critic will deduct.

---

## Re-running

The coauthor can re-run `/discover anchor` after updating their aspect spec (via `/discover interview`) or adding anchors to `anchor-index.md`. Output overwrites — but `references.bib` should be merged into `Bibliography_base.bib` (don't drop existing entries).
