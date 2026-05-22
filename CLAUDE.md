# CLAUDE.MD — NCA6 Economist-Coauthor Template

<!-- HOW TO USE: Fill in the placeholders below.
     Keep this file under ~150 lines — Claude loads it every session.
     For onboarding, see NCA6_COAUTHOR_GUIDE.md. -->

**Project type:** NCA6 chapter contribution (economist coauthor)
**NCA6 chapter:** [FILL IN — e.g., "Ch.19 Economic Impacts" — lead coauthor sets this per fork]
**Coauthor (you):** [YOUR NAME]
**Institution:** [YOUR INSTITUTION]
**Econ subfield:** [FILL VIA `/discover interview` — captured in the aspect spec]
**Branch:** main

---

## What This Template Is For

You are an economist contributing a section to an NCA6 chapter. Your econ subfield (labor, health, trade, public, IO, macro, development, environmental, finance, or other) gives you a specific lens. This template helps you run a **bridge literature search**: pulling together your subfield's work with the climate-economics anchors (NCA5 Ch.19, IPCC AR6 econ chapters, plus any anchors you add) that frame the chapter.

The output is a bridge-filtered annotated bibliography, claim-staleness flags, and an NCA6 section scaffold (Key Messages + Evidence Base + Uncertainties + Confidence + Likelihood + Traceable Accounts).

---

## Core Principles

- **Plan first** — enter plan mode before non-trivial tasks; save plans to `quality_reports/plans/`
- **Verify after** — compile and confirm output at end of every task
- **Anchor-driven** — your lit search starts from the anchors in `master_supporting_docs/anchors/`, not from a blank query
- **Bridge discipline** — every paper in your output connects your subfield to the climate-economics anchors
- **Quality gates** — weighted aggregate score; nothing ships below 80/100; see `.claude/rules/quality.md`
- **Worker-critic pairs** — every creator has a paired critic; critics never edit files

---

## Day-One Workflow (New Coauthors Start Here)

1. **Read `NCA6_COAUTHOR_GUIDE.md`** — step-by-step onboarding for any experience level.
2. **Fill the placeholders above** (chapter ID, your name, institution).
3. **Run `/discover interview`** — a short conversation that captures your subfield and your chosen climate-economics slice. Saves to `quality_reports/aspect_spec_[you].md`.
4. **Run `/discover anchor`** — runs the bridge literature search. Saves to `quality_reports/literature/[you]/`.
5. **Draft your section** — copy `paper/sections/contributions/_template.tex` to `[your-topic].tex` and fill in.

---

## Folder Structure

```
nca6-template/
├── CLAUDE.md                    # This file
├── NCA6_COAUTHOR_GUIDE.md       # Step-by-step onboarding
├── README.md                    # 60-second quickstart + pointer to guide
├── .claude/                     # Rules, skills, agents, hooks
├── Bibliography_base.bib        # Bibliography — sync canonical + add your own
├── paper/                       # NCA6 chapter manuscript
│   ├── main.tex                 # Chapter shell — includes all contributions
│   ├── sections/
│   │   ├── 00_executive_summary.tex
│   │   └── contributions/       # Per-coauthor sections live here
│   ├── preambles/nca6-preamble.tex
│   ├── figures/ tables/ supplementary/ replication/
│   └── talks/                   # Optional Beamer talks
├── master_supporting_docs/
│   └── anchors/                 # Anchor index + cached anchor content
│       ├── README.md            # What is an anchor + how to add yours
│       ├── anchor-index.md      # Pre-loaded NCA5/IPCC + coauthor-supplied
│       └── cache/               # Fetched anchor content (gitignored)
├── scripts/                     # Optional analysis code
├── quality_reports/             # Aspect specs, literature output, reviews
└── data/                        # If you bring data of your own
```

---

## Commands

```bash
# Paper compilation (latexmk handles multi-pass + biber automatically)
cd paper && latexmk main.tex

# Clean auxiliary files
cd paper && latexmk -c
```

---

## Skills Quick Reference

| Command | What It Does |
|---------|-------------|
| `/discover interview` | Two-axis interview (your subfield + chosen climate-econ slice) → aspect spec |
| `/discover anchor` | Bridge literature search anchored on NCA5/IPCC econ chapters → annotated bibliography + staleness flags |
| `/discover lit [topic]` | Non-anchored literature search (fallback if anchor scope is too narrow) |
| `/discover data [requirements]` | Data discovery (if your contribution involves your own analysis) |
| `/write [section]` | Draft your contribution section with paragraph-level argument structure |
| `/review [file]` | Quality reviews — routes by target |
| `/talk [mode] [format]` | Create Beamer/Quarto presentations (optional — for related seminars) |
| `/tools [subcommand]` | Utilities: commit, compile, validate-bib, etc. |

---

## Quality Thresholds

| Score | Gate | Applies To |
|-------|------|------------|
| 80 | Commit | Weighted aggregate (blocking) |
| 90 | PR | Weighted aggregate (blocking) |
| 95 | Chapter-ready | Aggregate + all components >= 80 |

---

## Anchor Quick Reference

The template ships with 7 pre-loaded climate-economics anchors in `master_supporting_docs/anchors/anchor-index.md`:

1. NCA5 Ch.19 Economic Impacts
2. IPCC AR6 WG2 Ch.16 Key Risks Across Sectors and Regions
3. IPCC AR6 WG2 Ch.17 Decision-Making Options for Managing Risk
4. IPCC AR6 WG3 Ch.3 Mitigation Pathways
5. IPCC AR6 WG3 Ch.13 National and Sub-National Policies
6. IPCC AR6 WG3 Ch.15 Investment and Finance
7. IPCC SR1.5

You can add subfield-specific anchors (NBER reviews, JEL surveys, *Annual Review* articles) by appending to the "Coauthor-Supplied Anchors" table in `anchor-index.md`. `/discover interview` also asks for them.

---

## What an Anchor Does

An anchor is a review-style document that gives your search five things:

1. Prior state of knowledge at the cutoff date
2. Seed citations for forward-snowball
3. Claim list (testable against post-cutoff lit)
4. Confidence/likelihood vocabulary (NCA/IPCC)
5. Scope frame

Without an anchor your search is unfocused. With one it's directional.

---

## Current Project State

| Component | File | Status |
|-----------|------|--------|
| Aspect spec | `quality_reports/aspect_spec_[you].md` | [not started / draft / approved] |
| Bridge lit review | `quality_reports/literature/[you]/` | [not started / draft / approved] |
| NCA6 section | `paper/sections/contributions/[you].tex` | [not started / draft / submitted] |
