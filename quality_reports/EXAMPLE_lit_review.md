# EXAMPLE — Bridge Literature Review (Labor Economist on NCA6)

**Status:** EXAMPLE — illustrates what `/discover anchor` produces. Replace with your own.

**Coauthor:** Jane Doe (mock)
**Subfield:** Labor economics (methods: reduced-form panel, IV, regression discontinuity)
**Slice:** Climate effects on US labor supply and earnings — especially heat exposure on hours worked, occupational sorting, and earnings dispersion

**Anchors Jane chose** (and the weights `/discover anchor` assigned given her aspect spec):
- IPCC AR6 WG2 Ch.16 — Key Risks Across Sectors and Regions — weight 5 (labor risk subsections heavily relevant)
- IPCC AR6 WG2 Ch.17 — Decision-Making Options for Managing Risk — weight 2 (light policy framing)
- IPCC AR6 WG3 Ch.3 — Mitigation Pathways — weight 1 (low; her methods don't match IAM literature)
- *Annual Review of Resource Economics* survey on environment-and-labor (coauthor-supplied) — weight 5

*Note: anchors are coauthor-supplied via `/discover interview`. The set above is what a labor economist might choose — not a default. Your anchor set will reflect your subfield.*

**Date:** 2026-05-22

---

## How to Read This File

This file is what `/discover anchor` produces for a coauthor whose aspect spec is "labor economist on climate × labor supply." Your file will have the same structure but with your subfield's literature.

Sections below show the **expected anatomy** of a bridge review. The actual entries are illustrative — they demonstrate the format, not a complete bibliography.

---

## Anchor 1: NCA5 Ch.19 — Economic Impacts (weight 5)

### Section 19.2 — Labor Productivity Under Heat Exposure

**Seed citations (in this section):**

- **Graff Zivin, J., & Neidell, M. (2014). "Temperature and the Allocation of Time: Implications for Climate Change." *Journal of Labor Economics* 32(1): 1–26.** — Status: **SEED**. Bridge tag: NCA5 Ch.19 §19.2. Subfield concept: time-use response to ambient temperature. *Foundational empirical estimate of labor-supply response to heat using ATUS micro data.*

- **Dell, M., Jones, B. F., & Olken, B. A. (2012). "Temperature Shocks and Economic Growth: Evidence from the Last Half Century." *AEJ: Macroeconomics* 4(3): 66–95.** — Status: **SEED**. Bridge tag: NCA5 Ch.19 §19.2 (cross-country evidence). Subfield concept: panel temperature-growth, with labor channel.

**New since cutoff (post-2022):**

- **[Hypothetical] Park, J., Pankratz, N., & Behrer, A. P. (2024). "Heat and Worker Health Risks." *AEJ: Applied* 16(3).** — Status: **NEW**. Bridge tag: NCA5 Ch.19 §19.2. Subfield concept: industry-level heat exposure with administrative wage data. *Identifies large heterogeneity in heat sensitivity across industries; suggests Graff Zivin & Neidell's aggregate result masks important sectoral variation.*

- *(Add additional NEW papers identified by forward-citation snowball from each seed since the anchor's 2022 cutoff.)*

### Section 19.3 — Aggregate Effects and Distributional Implications

**Seed citations:**
- (similar structure)

**New since cutoff:**
- (similar structure)

---

## Anchor 2: IPCC AR6 WG2 Ch.16 — Key Risks Across Sectors and Regions (weight 4)

### Section 16.5 — Labor and Livelihoods Under Climate Risk

**Seed citations:**
- *(see structure above)*

**New since cutoff (post-2021):**
- *(see structure above)*

---

## Anchor 3: IPCC AR6 WG2 Ch.17 — Decision-Making Options for Managing Risk (weight 2)

This anchor is weight 2 because Jane's slice is descriptive/empirical, not decision-theoretic. Including only the small subset of references that bridge to labor economics methods.

- *(short list, lower density)*

---

## Adjacent-Subfield Surfacing

3–5 papers from adjacent subfields engaging Jane's slice that she may not be tracking. See `adjacent_surfacing.md` for full entries.

Summary:
- **Health econ angle:** [Hypothetical] Chen et al. (2024) on heat-mortality in occupational settings — bridges to Jane's hours-worked outcome via the underlying biological channel.
- **Trade angle:** Costinot, Donaldson & Smith (JPE 2016) on agricultural comparative advantage — relevant because labor reallocation across sectors is a margin Jane's slice touches.
- **Macro angle:** Newell, Prest & Sexton (REStat 2021) on damages and growth — methodological precedent for translating micro labor estimates to aggregate damages.

---

## Notes

- **Anchors not fetched:** IPCC SR1.5 URL was reachable but its labor content is sparse — down-weighted to 0 (not used).
- **Ambiguities in aspect spec:** Jane's spec said "labor supply and earnings" but did not specify whether to prioritize extensive (participation) or intensive (hours) margin. Output covers both, weighted toward intensive following the anchor emphasis.
- **Coauthor-supplied anchors:** None added by Jane. (If she had added, e.g., Graff Zivin & Neidell's *Annual Review of Resource Economics* 2018 survey on environment-and-labor, it would appear as Anchor 4.)

---

## Companion files (also produced by `/discover anchor`)

- `references.bib` — BibTeX entries for everything above
- `staleness_flags.md` — anchor claims with `CONFIRMED` / `EXTENDED` / `CONTESTED` / `OPEN` labels
- `adjacent_surfacing.md` — full entries for the adjacent-subfield papers
- `frontier_map.md` — where the bridge stands now
- `positioning.md` — suggested framing for Jane's NCA6 contribution

---

*To produce your own version: run `/discover interview`, then `/discover anchor`. Replace this file's content with what your run produces, or delete this file once your real lit review is in place.*
