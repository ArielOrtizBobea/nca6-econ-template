# Anchors

This directory holds the **anchor documents** that drive bridge-aware literature search via `/discover anchor`. If you're a new NCA6 coauthor reading this for the first time, start here.

---

## What is an anchor?

An anchor is an authoritative review-style document — typically a chapter from a major scientific assessment (NCA5, IPCC AR6, IPCC SR1.5) — that serves five jobs for your literature search:

1. **Prior state of knowledge.** It tells you what the field had agreed at the cutoff date.
2. **Seed citations.** Its bibliography is a curated set of foundational papers — your search starts from there rather than from a blank query.
3. **Claim list.** Its core statements are testable; some have been challenged or extended in post-cutoff work. The anchor mode flags those for you.
4. **Confidence and likelihood vocabulary.** It carries the standardized language (NCA/IPCC ladders) you must use in your NCA6 contribution.
5. **Scope frame.** It tells you what is in and out of the field's territory — so your bridge search stays focused.

**Without an anchor, literature search is unfocused. With one, it's directional.**

---

## Pre-loaded defaults

`anchor-index.md` ships with seven climate-economics anchors pre-listed: the NCA5 economics chapter, four IPCC AR6 economics-relevant chapters (WG2 Ch.16/17, WG3 Ch.3/13/15), and the IPCC SR1.5 special report. These cover the main framings any economist contributing to NCA6 will need.

You do not need to fetch them manually. The first time you run `/discover anchor`, the URLs are resolved and cached in `cache/` (gitignored).

---

## Adding your own anchors

Some coauthors will want to anchor on additional documents that are closer to their subfield — e.g., a *Handbook of Environmental Economics* chapter, an *Annual Review of Resource Economics* article, an NBER survey, or a regional assessment.

To add an anchor:

1. Open `anchor-index.md`.
2. Add a row to the "Coauthor-Supplied Anchors" table with: a citation key (snake_case), the source (publisher, year), a one-line scope description, the document's cutoff date, and a stable URL.
3. If the document is paywalled or has no stable URL, drop the PDF into `cache/` and reference the cache path.

The next `/discover anchor` run will pick up your additions automatically.

You can also add anchors interactively — `/discover interview` will ask whether you want to suggest additional anchors before producing your aspect spec.

---

## File layout

```
master_supporting_docs/anchors/
├── README.md              # This file
├── anchor-index.md        # Canonical list of anchors (pre-loaded + coauthor-supplied)
└── cache/                 # Fetched anchor content (gitignored)
    └── .gitkeep
```

The `cache/` directory is gitignored so coauthors don't bloat the repo by checking in PDFs. If you have an anchor that lives only as a local file, just keep it in `cache/` — Claude will read it from there.

---

## When anchors aren't enough

Some lit searches benefit from going beyond the anchor's reach — discovering papers in subfields the anchor underweights, or methods literature not yet integrated into climate assessments. That's exactly what bridge mode is designed to surface: the librarian-critic flags when the search hugs the anchor too closely without bringing in subfield-native literature.

If you find the anchor set isn't producing useful breadth for your topic, add more anchors (above) or fall back to standalone `/discover lit [topic]` for a non-anchored search.
