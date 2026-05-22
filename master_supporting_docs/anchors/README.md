# Anchors

This directory holds the **anchor documents** that drive bridge-aware literature search via `/discover anchor`. If you're a new NCA6 coauthor reading this for the first time, start here.

---

## What is an anchor?

An anchor is an authoritative review-style document — typically a chapter from NCA5, IPCC AR6, a *Handbook* volume, a *Journal of Economic Literature* survey, an *Annual Review* article, or an NBER review — that serves five jobs for your literature search:

1. **Prior state of knowledge.** It tells you what the field had agreed at the cutoff date.
2. **Seed citations.** Its bibliography is a curated set of foundational papers — your search starts from there rather than from a blank query.
3. **Claim list.** Its core statements are testable; some have been challenged or extended in post-cutoff work. The anchor mode flags those for you.
4. **Confidence and likelihood vocabulary.** It carries the standardized language (NCA/IPCC ladders) you must use in your NCA6 contribution.
5. **Scope frame.** It tells you what is in and out of the field's territory — so your bridge search stays focused.

**Without an anchor, literature search is unfocused. With one, it's directional.**

---

## Coauthor-supplied: you decide

This template does **not** ship with a canonical list of anchors. Different coauthors will anchor on different review documents depending on their econ subfield and chosen climate-economics slice. A labor economist might anchor on an *Annual Review of Resource Economics* article on environment-and-labor plus IPCC WG2 Ch.16. A trade economist might anchor on a *JEL* survey of border-adjustment carbon policy plus IPCC WG3 Ch.13. You know your subfield — pick the anchors that frame your contribution.

The file `anchor-index.md` includes a few **examples** of review documents an economist contributing to NCA6 might choose. They are not loaded automatically — you decide which (if any) to use, and you add your own.

---

## Two ways to add anchors

**Conversational** (recommended for first-timers):
Run `/discover interview`. The interview includes a question about which review documents you want to anchor your search on. Your choices are appended to `anchor-index.md` automatically.

**Manual:**
1. Open `anchor-index.md`.
2. Add a row to the "Your Anchors" table with citation key, source, scope, cutoff date, and URL.
3. Add a matching BibTeX entry to `Bibliography_base.bib`.
4. If the anchor is a paywalled PDF, drop the PDF into `cache/` and reference the cache path instead of a URL.

---

## File layout

```
master_supporting_docs/anchors/
├── README.md              # This file
├── anchor-index.md        # Your anchors + examples to consider
└── cache/                 # Fetched or local anchor PDFs (gitignored)
    └── .gitkeep
```

The `cache/` directory is gitignored so coauthors don't bloat the repo by checking in PDFs. If you have an anchor that lives only as a local file, just keep it in `cache/` — Claude will read it from there.

---

## When anchors aren't enough

Some lit searches benefit from going beyond the anchor's reach — discovering papers in subfields the anchor underweights, or methods literature not yet integrated into climate assessments. The librarian-critic flags when the search hugs the anchor too closely. If anchors aren't producing useful breadth, add more anchors or fall back to standalone `/discover lit [topic]` for a non-anchored search.
