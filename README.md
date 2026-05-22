# Empirical Research Template

A reproducible-research scaffold for empirical work in economics and adjacent fields (finance, accounting, marketing, management). Designed for use with Claude Code, but the LaTeX scaffolding, folder structure, and quality conventions are useful on their own.

## What This Template Provides

- **Paper scaffold** — a working `paper/` directory with `latexmkrc`, a standardized preamble, and slots for sections, tables, figures, supplementary material, talks, and a replication package.
- **Bibliography** — single `Bibliography_base.bib` as the source of truth, with `biblatex` + `biber` configured.
- **Analysis scaffold** — `scripts/` for R, Python, or Julia, plus `data/` (`raw/` and `cleaned/`) with `.gitkeep` placeholders.
- **Claude Code integration** — agents, skills, rules, and hooks under `.claude/` that orchestrate a research pipeline: discovery → strategy → execution → write → review → submission. Standalone use is fine; pipeline use is optional.
- **Quality gates** — a weighted aggregate score with thresholds for commit, PR, and submission. See `.claude/rules/quality.md`.
- **GitHub Actions CI** — `paper/main.tex` compiles automatically on push.

## Getting Started

1. Click "Use this template" on GitHub to create your own copy.
2. Fill in the bracketed placeholders in `CLAUDE.md` (project name, institution, field).
3. Optionally edit `.claude/references/domain-profile.md` and `journal-profiles.md` to reflect your field.
4. If using Claude Code: open the repo and run `/discover interview [your topic]` to kick off a research specification.
5. If not using Claude Code: the LaTeX scaffolding, folder structure, and quality rules still work standalone.

## Folder Structure

```
.
├── CLAUDE.md                    # Project-level instructions for Claude Code
├── MEMORY.md                    # Auto-managed learning index
├── CHANGELOG.md                 # Template version history
├── Bibliography_base.bib        # Single source of truth for references
├── paper/                       # LaTeX manuscript (source of truth)
│   ├── main.tex                 # Primary paper (create this)
│   ├── sections/                # Section-level .tex files
│   ├── figures/                 # Generated figures
│   ├── tables/                  # Generated tables
│   ├── talks/                   # Beamer presentations
│   ├── preambles/               # Shared preamble
│   ├── quarto/                  # Quarto RevealJS presentations
│   ├── supplementary/           # Online appendix
│   └── replication/             # Replication package for deposit
├── data/
│   ├── raw/                     # Original untouched data (often gitignored)
│   └── cleaned/                 # Processed datasets
├── scripts/                     # Analysis code (R, Python, Julia)
├── quality_reports/             # Plans, session logs, reviews, scores
├── explorations/                # Research sandbox
├── templates/                   # Session log, requirements-spec templates
├── master_supporting_docs/      # Reference papers and data documentation
└── guide/                       # Quarto user guide (rendered to docs/)
```

## Compiling the Paper

```bash
cd paper && latexmk main.tex     # Multi-pass + biber handled by latexmk
cd paper && latexmk -c           # Clean auxiliary files
```

On Overleaf, set the compiler to XeLaTeX via Menu — Overleaf reads `latexmkrc` automatically.

## Customizing for Your Field

The template defaults to economics conventions but is field-agnostic. Two files do most of the customization:

- `.claude/references/domain-profile.md` — your field's methods, journals, and conventions.
- `.claude/references/journal-profiles.md` — target journals' formatting requirements.

Both ship with bracketed placeholders. Fill them in once and the agents will use them.

## License

[Choose a license. MIT and Apache-2.0 are common defaults.]
