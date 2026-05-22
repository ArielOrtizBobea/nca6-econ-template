# Domain Profile

<!--
HOW TO USE: Fill this in manually OR let /discover (interactive interview) generate it.
All agents read this file to calibrate their field-specific behavior.

This template ships with an NCA6 Chapter Context overlay below — it applies to all coauthors regardless of subfield. The sections beneath (Field, Target Journals, etc.) are per-coauthor and get filled when /discover interview captures the aspect spec.
-->

---

## NCA6 Chapter Context

<!-- This section is shared across all coauthors. The Librarian, Strategist, Writer, and Critics read it for chapter-level calibration. -->

**Chapter:** [FILL IN — e.g., "NCA6 Chapter 19: Economic Impacts" — set per fork by the lead coauthor]
**Lead coauthor(s):** [FILL IN]
**Output format:** NCA6 chapter (Key Messages + Description of Evidence Base + Major Uncertainties + Description of Confidence + Description of Likelihood + Traceable Accounts)
**Anchor index:** `master_supporting_docs/anchors/anchor-index.md`

### Confidence Ladder (NCA standard)

| Level | When to use |
|-------|-------------|
| Very High | Strong evidence (established theory, multiple sources, consistent results, methods accounted for) and high consensus |
| High | Moderate evidence (several sources, some consistency, methods vary and/or documented limits) and medium consensus |
| Medium | Suggestive evidence (a few sources, limited consistency, methods emerging) and competing schools of thought |
| Low | Inconclusive evidence (limited sources, extrapolations, inconsistent findings, poor documentation and/or methods not tested) and disagreement or lack of opinions among experts |

### Likelihood Ladder (NCA standard, when probabilistic)

| Level | Probability range |
|-------|-------------------|
| Virtually Certain | 99–100% |
| Very Likely | 90–99% |
| Likely | 66–90% |
| As Likely as Not | 33–66% |
| Unlikely | 10–33% |
| Very Unlikely | 1–10% |
| Exceptionally Unlikely | 0–1% |

Every Key Message in a coauthor's contribution must carry both a confidence label and (when probabilistic) a likelihood label. The writer-critic enforces this; see `.claude/rules/content-invariants.md`.

### Bridge Reference Table

The Librarian uses this in Bridge Anchor Mode to weight anchors against the coauthor's subfield. Each row maps an econ subfield to typical climate-economics connection points and seminal examples.

| Subfield | Connection points to climate-economics | Seminal examples |
|----------|---------------------------------------|------------------|
| Labor | Heat/climate effects on labor supply, productivity, occupational health, migration | Graff Zivin & Neidell (JLE 2014); Dell, Jones & Olken (AEJ:Macro 2012); Deryugina & Hsiang (NBER 2014) |
| Health | Mortality and morbidity from temperature; air-quality-mediated health; nutrition and food security | Deschênes & Greenstone (AEJ:AE 2011); Carleton et al. (QJE 2022); Burke, Hsiang & Miguel (Nature 2015) |
| Trade | Climate-driven trade flow shifts, comparative advantage, border-adjustment carbon policy, supply-chain disruption | Costinot, Donaldson & Smith (JPE 2016); Nordhaus (AER 2007); Markusen literature on trade-environment |
| Public / policy | Carbon pricing design and pass-through, regulation incidence, environmental federalism, climate adaptation programs | Goulder & Hafstead (JEEM 2017); Fowlie, Reguant & Ryan (AER 2016); Borenstein literature on electricity markets |
| IO / regulation | Firm-level adaptation, innovation responses to climate policy, market power in transition sectors | Aghion et al. (JPE 2016); Calel & Dechezleprêtre (REStat 2016) |
| Macro / growth | Climate damages in growth models, integrated assessment models (IAMs), business cycles and disasters | Nordhaus DICE (1992–present); Burke, Hsiang & Miguel (Nature 2015); Hsiang et al. (Science 2017) |
| Development | Climate effects in low- and middle-income contexts, agricultural shocks, conflict, migration, poverty traps | Dell, Jones & Olken (JEL 2014); Hsiang (PNAS 2010); Burke et al. (Nature 2015) |
| Environmental | Non-market valuation, ecosystem services, biodiversity-economics, externality measurement | Hsiang, Oliva & Walker (NBER 2019); Costello et al. (Nature 2020); Banzhaf & Walsh (AER 2008) |
| Finance | Climate risk pricing, transition risk and stranded assets, climate-aware portfolio choice, green bonds | Krueger, Sautner & Starks (RFS 2020); Hong, Karolyi & Scheinkman (RFS 2020); Bolton & Kacperczyk (JFE 2021) |

Subfield not listed? The coauthor's aspect spec is authoritative — the Librarian should extend this table during the bridge search. Seminal examples are illustrative, not exhaustive; the Librarian's job in bridge mode is to find what's missing here.

---

## Field

**Primary:** [FILL VIA `/discover interview` — coauthor's econ subfield from Axis 1]
**Adjacent subfields:** [FILL VIA `/discover interview` — neighboring subfields the coauthor wants to surface]

---

## Target Journals (ranked by tier)

<!-- The Orchestrator uses this for journal selection. The Librarian prioritizes these in searches. -->

| Tier | Journals |
|------|----------|
| Top-5 | AER, Econometrica, JPE, QJE, REStud |
| Top field | [e.g., JHE, RAND JE, AEJ:EP, AEJ:Applied] |
| Strong field | [e.g., Health Affairs, AJHE, JPubE, JHR] |
| Specialty | [e.g., Medical Care, Health Services Research] |

---

## Common Data Sources

<!-- The Explorer prioritizes these. The explorer-critic knows their quirks. -->

| Dataset | Type | Access | Notes |
|---------|------|--------|-------|
| [e.g., CPS] | [survey/admin/panel] | [public/restricted] | [key strengths and limitations] |

---

## Common Identification Strategies

<!-- The Strategist considers these first. The strategist-critic knows field-specific threats. -->

| Strategy | Typical Application | Key Assumption to Defend |
|----------|-------------------|------------------------|
| [e.g., State-level DiD] | [Policy variation across states] | [Parallel trends in outcomes across treated/control states] |

---

## Field Conventions

<!-- The Coder and Writer follow these. The writer-critic checks for them. -->

- [e.g., Binary outcomes → report LPM alongside logit/probit marginal effects]
- [e.g., Cost outcomes → log transform or GLM (Gamma, log link)]
- [e.g., Clustering at state level for state-level policy variation]
- [e.g., Always discuss moral hazard / adverse selection implications]
- [e.g., Welfare analysis expected in top-5 submissions]

---

## Notation Conventions

<!-- The Writer and writer-critic enforce these. -->

| Symbol | Meaning | Anti-pattern |
|--------|---------|-------------|
| [e.g., $Y_{it}$] | [Outcome for individual i at time t] | [Don't use $y$ without subscripts] |

---

## Seminal References

<!-- The Librarian ensures these are cited when relevant. The strategist-critic knows their methods. -->

| Paper | Why It Matters |
|-------|---------------|
| [e.g., Finkelstein et al. (2012)] | [Oregon HIE — gold standard for insurance effects] |

---

## Field-Specific Referee Concerns

<!-- The domain-referee and methods-referee watch for these. -->

- [e.g., "Why not use the Oregon HIE?" — must address if studying insurance effects]
- [e.g., "Selection into treatment" — always a concern in health care utilization studies]
- [e.g., "Moral hazard vs adverse selection" — referees expect you to distinguish]
- [e.g., "External validity" — Medicaid population ≠ general population]

---

## Quality Tolerance Thresholds

<!-- Customize for your domain's standards. Used by quality.md. -->

| Quantity | Tolerance | Rationale |
|----------|-----------|-----------|
| Point estimates | [e.g., 1e-6] | [Numerical precision] |
| Standard errors | [e.g., 1e-4] | [MC variability] |
| Coverage rates | [e.g., ± 0.01] | [Simulation with B reps] |
