# Contributions — Per-Coauthor Sections

Each NCA6 coauthor's contribution lives in this directory as a separate `.tex` file. The chapter shell (`paper/main.tex`) pulls them in via `\input{}`.

## How to add your contribution

```bash
cd paper/sections/contributions
cp _template.tex [your-topic].tex
```

Conventions for file naming:

- Use lowercase with underscores: `labor_supply.tex`, `health_welfare.tex`, `trade_flows.tex`, `carbon_pricing.tex`
- Avoid your name — use the topic so the lead coauthor doesn't have to remember who covers what
- Single file per contribution; if you have multiple distinct slices, split them into multiple files

Then fill in the template. Each contribution has:

1. **Opening framing** — 1–2 paragraphs on your slice and how it connects to the anchors
2. **Key Messages** (KMs) — each with confidence and (when probabilistic) likelihood
3. **Description of Evidence Base** — per KM
4. **Major Uncertainties** — per KM
5. **Description of Confidence** — per KM (why this level)
6. **Description of Likelihood** — per KM (when probabilistic)
7. **Traceable Account** — per KM (claim → citation map)

The template at `_template.tex` carries all the LaTeX environments you need (`keymessage`, `\confidence{}`, `\likelihood{}`, `\evidencebase`, `\uncertainties`, `\confidencedesc`, `\likelihooddesc`, `\traceableaccount`).

## Linking your contribution into the chapter

Once your `.tex` file is in place, add it to `paper/main.tex`:

```latex
\input{sections/contributions/[your-topic].tex}
```

Order matters for the lead coauthor's synthesis — coordinate with them.

## Quality gates

The writer-critic checks each contribution against `.claude/rules/content-invariants.md`. NCA6-specific invariants enforce:

- Every KM has a confidence label
- Every KM with probabilistic content has a likelihood label
- Every KM claim has a Traceable Account entry mapping it to a citation
- Every anchor referenced in your contribution is in `Bibliography_base.bib`

Run `/review paper/sections/contributions/[your-topic].tex` to get a critic report.
