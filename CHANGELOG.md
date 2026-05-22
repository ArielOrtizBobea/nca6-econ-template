# Changelog

This template's release history. For the upstream clo-author scaffold's history (the basis this builds on), see https://github.com/hugosantanna/clo-author/blob/main/CHANGELOG.md.

---

## [1.0.0] — 2026-05-22 — Initial NCA6 Coauthor Release

First sharable release of the template for NCA6 economist coauthors.

**Core workflow:**
- `/discover interview` (NCA6 two-axis variant) — captures coauthor's econ subfield + chosen climate-economics slice into an aspect spec; also asks which review documents to use as anchors
- `/discover anchor` — bridge-aware literature search anchored on coauthor-supplied documents (NCA5 chapters, IPCC AR6 chapters, *Annual Review* surveys, JEL surveys, NBER reviews, *Handbook* volumes)
- Bridge Anchor Mode in the librarian agent with Mode B critic deductions enforcing anchor coverage, bridge discipline, forward-citation completeness, and staleness work

**NCA6 chapter scaffolding:**
- `paper/main.tex` chapter shell with multi-coauthor authors block
- `paper/sections/contributions/_template.tex` per-coauthor section template with KMs, Evidence Base, Major Uncertainties, Confidence, Likelihood, Traceable Accounts
- `paper/preambles/nca6-preamble.tex` with `keymessage`, `\confidence{}`, `\likelihood{}` environments

**Domain calibration:**
- General-economics domain profile with NCA6 overlay (chapter context, NCA confidence/likelihood ladders, Bridge Reference Table covering nine econ subfields)
- Content invariants INV-22 through INV-27 enforcing NCA discipline

**Infrastructure:**
- `master_supporting_docs/anchors/` — coauthor-supplied anchor index + gitignored cache
- `scripts/sync-shared-bib.sh` — bib sync (placeholder URL, configurable)
- Example bibliography entries for five verified IPCC AR6 chapters

**Onboarding:**
- `NCA6_COAUTHOR_GUIDE.md` — step-by-step for mixed-experience coauthors
- Two-tier README — quickstart for experienced users + pointer to guide
- `quality_reports/EXAMPLE_lit_review.md` — worked example (labor economist on climate × labor supply)
