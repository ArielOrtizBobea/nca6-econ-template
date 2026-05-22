# Anchor Index — NCA6 Coauthor Template

**Purpose:** This file lists the documents that anchor each coauthor's literature search. The `/discover anchor` skill reads this index, fetches the listed documents (caching them in `cache/`), and uses them as seed material for a bridge-aware search.

**See `README.md` in this directory for what an anchor *is* and *does*.**

---

## Pre-loaded Anchors (climate economics)

These seven chapters span the dominant economics framings in current climate assessments. Coauthors don't need to use all of them — `/discover anchor` weights them based on the coauthor's subfield and stated slice. URLs are best-known references at template publication; please verify and update if a URL has changed.

| # | Citation key | Source | Chapter / scope | Cutoff | URL |
|---|--------------|--------|-----------------|--------|-----|
| 1 | `nca5_ch19_economics` | NCA5 (USGCRP, 2023) | Ch.19 "Economics" — dedicated economics chapter of the Fifth National Climate Assessment | 2022 | https://nca2023.globalchange.gov/chapter/19/ |
| 2 | `ipcc_ar6_wg2_ch16_keyrisks` | IPCC AR6 WG2 (2022) | Ch.16 "Key Risks Across Sectors and Regions" — cross-sector risk framing, RFCs, aggregate impacts | 2021 | https://www.ipcc.ch/report/ar6/wg2/chapter/chapter-16/ |
| 3 | `ipcc_ar6_wg2_ch17_decisions` | IPCC AR6 WG2 (2022) | Ch.17 "Decision-Making Options for Managing Risk" — decision economics under climate uncertainty | 2021 | https://www.ipcc.ch/report/ar6/wg2/chapter/chapter-17/ |
| 4 | `ipcc_ar6_wg3_ch3_pathways` | IPCC AR6 WG3 (2022) | Ch.3 "Mitigation Pathways Compatible with Long-Term Goals" — IAMs, scenario economics, cost trajectories | 2021 | https://www.ipcc.ch/report/ar6/wg3/chapter/chapter-3/ |
| 5 | `ipcc_ar6_wg3_ch13_policies` | IPCC AR6 WG3 (2022) | Ch.13 "National and Sub-National Policies and Institutions" — policy instrument design and evaluation | 2021 | https://www.ipcc.ch/report/ar6/wg3/chapter/chapter-13/ |
| 6 | `ipcc_ar6_wg3_ch15_finance` | IPCC AR6 WG3 (2022) | Ch.15 "Investment and Finance" — climate finance, capital flows, transition risk | 2021 | https://www.ipcc.ch/report/ar6/wg3/chapter/chapter-15/ |
| 7 | `ipcc_sr15_2018` | IPCC SR1.5 (2018) | Special Report on Global Warming of 1.5°C — pathways and economic implications | 2017 | https://www.ipcc.ch/sr15/ |

---

## Coauthor-Supplied Anchors

Add review-style documents specific to your subfield here. Examples:

- A *Handbook of Environmental Economics* chapter that surveys your area
- A relevant *Journal of Economic Literature* survey article
- An NBER-style review or *Annual Review of Resource Economics* article
- A subfield-specific climate review (e.g., labor-and-climate review for labor economists)
- Regional assessments (e.g., EU Climate Risk Assessment) if your contribution has regional scope

Use the same column structure as the pre-loaded table. Stable URLs preferred; cached PDFs in `cache/` are acceptable for paywalled or older sources.

| Citation key | Source | Chapter / scope | Cutoff | URL or cache path |
|--------------|--------|-----------------|--------|-------------------|
| | | | | |

---

## How `/discover anchor` uses this index

1. Reads the table(s) above; resolves URLs (or cache paths) to document text.
2. Cross-references each anchor with the coauthor's `aspect_spec` (subfield + slice) from `/discover interview`.
3. Weights each anchor by relevance to the coauthor's subfield — a public economist will pull more from Ch.13 (Policies); a finance economist more from Ch.15 (Investment & Finance); a development economist more from Ch.16 (Cross-sector Risks) and Ch.17 (Decisions).
4. Extracts seed citations from the highest-weighted anchors and runs a forward-citation snowball filtered by the subfield.
5. Flags claims in the anchors that have been challenged or extended in post-cutoff literature.
6. Produces an annotated bibliography organized by anchor section, tagged by subfield concept.

If no `aspect_spec` exists yet, `/discover anchor` will prompt the coauthor to run `/discover interview` first.
