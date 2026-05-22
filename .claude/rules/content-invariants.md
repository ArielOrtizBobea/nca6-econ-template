# Content Invariants

These are non-negotiable. Every agent checks against them. Violations are deductions, not suggestions. Critics cite invariant numbers (e.g., "violates INV-3") in their reports.

---

## Paper

**INV-1.** Every table has notes explaining key variables, sample, and data source — via `threeparttable` + `tablenotes` (traditional) or `talltblr` with `note{}` keys (tabularray).

**INV-2.** Every figure has a `\caption{}` with a note explaining what is shown, how to read it, and the data source.

**INV-3.** No `\hline` — use `\toprule`, `\midrule`, `\bottomrule` (booktabs). No vertical rules.

**INV-4.** Significance stars follow the journal profile. AEA journals: no stars, report standard errors and use confidence intervals. Default: stars with note defining thresholds.

**INV-5.** Abstract is 150 words or fewer.

**INV-6.** JEL codes and keywords present after the abstract.

**INV-7.** Notation is consistent across all sections — the same symbol means the same thing everywhere. Different concepts get different symbols.

**INV-8.** Every causal claim has a corresponding identification section. No causal language in descriptive papers.

**INV-9.** `biblatex` + `biber`, not `natbib` + `bibtex`.

**INV-10.** `hyperref` loaded second-to-last in preamble; `cleveref` loaded immediately after it.

**INV-11.** Numbers in text match the tables and figures exactly. No rounding discrepancies, no stale values.

**INV-12.** No titles inside ggplot/matplotlib figures. Titles go in LaTeX `\caption{}`. Panel labels ("Panel A: ...") inside multi-panel figures are fine.

**INV-13.** R/Python/Julia scripts export bare `tabular` environments — no `\begin{table}`, `\caption{}`, or notes. The paper's `main.tex` wraps them.

## Code

**INV-14.** `set.seed()` (or language equivalent) called exactly once, at the top of the main script, if any stochastic element exists.

**INV-15.** All packages/libraries loaded at the top of the script, before any data loading or computation.

**INV-16.** No absolute paths. All paths relative to project root via `here()` (R), `pathlib.Path` (Python), or `joinpath(@__DIR__, ...)` (Julia).

**INV-17.** No growing vectors/lists in loops. Pre-allocate result containers or use vectorized operations.

**INV-18.** Output files go to the path specified by the Output Organization setting in `CLAUDE.md`.

**INV-19.** No prohibited functions: `setwd()` / `os.chdir()` / `cd()`, `rm(list = ls())`, `install.packages()` in scripts, `attach()` / `detach()`.

## Talk

**INV-20.** Notation in talk matches paper exactly — same symbols, same subscripts, same definitions.

**INV-21.** Every claim on a slide is traceable to the paper. No orphan results or numbers that don't appear in the manuscript.

## NCA6 Chapter Contributions

These invariants apply when the paper format is an NCA6 chapter contribution (`paper/sections/contributions/*.tex` files using the NCA6 preamble). They do NOT apply to standalone working papers.

**INV-22.** Every Key Message (`keymessage` environment) carries a `\confidence{level}` label using the NCA confidence ladder (very high / high / medium / low).

**INV-23.** Every probabilistic Key Message also carries a `\likelihood{level}` label using the NCA likelihood ladder (virtually certain / very likely / likely / as likely as not / unlikely / very unlikely / exceptionally unlikely).

**INV-24.** Every Key Message has a Traceable Account (`\traceableaccount` paragraph) mapping each claim in the KM to one or more citations. No orphan KM claims.

**INV-25.** Every anchor cited in a contribution (NCA5 Ch.19, IPCC AR6 econ chapters, IPCC SR1.5, coauthor-supplied anchors listed in `master_supporting_docs/anchors/anchor-index.md`) must have a corresponding BibTeX entry in `Bibliography_base.bib`.

**INV-26.** Confidence and likelihood assignments must be justified — every KM with a confidence label has a `\confidencedesc` paragraph explaining why (strength of evidence × consensus). Every KM with a likelihood label has a `\likelihooddesc` paragraph.

**INV-27.** A contribution's NCA elements appear in this order per KM: `keymessage` block → `\evidencebase` → `\uncertainties` → `\confidencedesc` → (optional) `\likelihooddesc` → `\traceableaccount`. The writer-critic checks ordering.

---

## How Agents Use This File

| Agent | Checks | Action on Violation |
|-------|--------|-------------------|
| **writer-critic** | INV-1 through INV-13, INV-22 through INV-27 (when format = NCA6) | Deduct per scoring rubric |
| **coder-critic** | INV-13 through INV-19 | Deduct per scoring rubric |
| **storyteller-critic** | INV-20, INV-21 | Deduct per scoring rubric |
| **verifier** | INV-9, INV-10, INV-14, INV-15, INV-16, INV-19, INV-25 | FAIL if present |
| **lint hook** | INV-14, INV-15, INV-16, INV-19 | Advisory warning |
| **librarian-critic** | INV-25 (anchors cited must be in bib) | Deduct per scoring rubric |
