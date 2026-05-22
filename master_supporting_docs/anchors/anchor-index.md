# Anchor Index — NCA6 Coauthor Template

**Anchors are coauthor-supplied.** This template does not ship with a canonical anchor set — *you* know which review documents define the climate-economics scope for your contribution. Add your anchors below before running `/discover anchor`.

See `README.md` in this directory for what an anchor *is* and *does*.

---

## Your Anchors

Add one row per anchor you want `/discover anchor` to use. Stable URLs preferred; for paywalled or older sources, drop the PDF into `cache/` and reference the cache path.

| Citation key | Source | Chapter / scope | Cutoff | URL or cache path |
|--------------|--------|-----------------|--------|-------------------|
| | | | | |
| | | | | |

The `/discover interview` skill walks you through filling this in if you'd rather do it conversationally.

---

## Examples to Consider

These are review documents an economist contributing to NCA6 might choose as anchors. **They are not pre-loaded** — copy any you want to use into the "Your Anchors" table above, edit/extend as needed. Skip the ones that don't fit your slice.

The five IPCC AR6 entries below have been verified (author lists, DOIs, exact titles) and have corresponding BibTeX entries in `Bibliography_base.bib`. Other examples are starting points you'll want to confirm before using.

### IPCC AR6 — verified

| Citation key | Source | Chapter / scope | Cutoff | URL |
|--------------|--------|-----------------|--------|-----|
| `ipcc_ar6_wg2_ch16_keyrisks` | IPCC AR6 WG2 (2022) | Ch.16 "Key Risks Across Sectors and Regions" — cross-sector economic risk framing, RFCs, aggregate impacts | 2021 | https://www.ipcc.ch/report/ar6/wg2/chapter/chapter-16/ |
| `ipcc_ar6_wg2_ch17_decisions` | IPCC AR6 WG2 (2022) | Ch.17 "Decision-Making Options for Managing Risk" — decision economics under climate uncertainty | 2021 | https://www.ipcc.ch/report/ar6/wg2/chapter/chapter-17/ |
| `ipcc_ar6_wg3_ch3_pathways` | IPCC AR6 WG3 (2022) | Ch.3 "Mitigation Pathways Compatible with Long-Term Goals" — IAMs, scenario economics, cost trajectories | 2021 | https://www.ipcc.ch/report/ar6/wg3/chapter/chapter-3/ |
| `ipcc_ar6_wg3_ch13_policies` | IPCC AR6 WG3 (2022) | Ch.13 "National and Sub-National Policies and Institutions" — policy instrument design and evaluation | 2021 | https://www.ipcc.ch/report/ar6/wg3/chapter/chapter-13/ |
| `ipcc_ar6_wg3_ch15_finance` | IPCC AR6 WG3 (2022) | Ch.15 "Investment and Finance" — climate finance, capital flows, transition risk | 2021 | https://www.ipcc.ch/report/ar6/wg3/chapter/chapter-15/ |

### Other examples (verify before using)

| Source | Likely chapter/scope | Why an economist might cite |
|--------|---------------------|----------------------------|
| NCA5 | Ch.19 "Economics" (USGCRP, 2023) | Dedicated economics chapter of the prior NCA |
| IPCC SR1.5 | Special Report on Global Warming of 1.5°C (2018) | 1.5°C pathways and economic implications |
| IPCC SRCCL | Special Report on Climate Change and Land (2019) | Land-use economics |
| *Annual Review of Resource Economics* | Recent surveys in your subfield | Subfield-specific climate-economics synthesis |
| *Journal of Economic Literature* survey | Recent survey in your area | High-quality field survey |
| NBER review chapter | NBER chapter in climate-economics | Working paper-level synthesis |
| *Handbook of Environmental Economics* | Relevant volume/chapter | Foundational subfield reference |

For each anchor you decide to use, fill out the row in "Your Anchors" above and add a BibTeX entry to `Bibliography_base.bib` (matching the citation key).

---

## How `/discover anchor` uses this index

1. Reads "Your Anchors" above; resolves URLs (or cache paths) to document text.
2. Cross-references each anchor with your aspect spec (subfield + slice) from `/discover interview`.
3. Weights each anchor by relevance to your subfield.
4. Extracts seed citations from the highest-weighted anchors and runs a forward-citation snowball filtered by the subfield.
5. Flags claims in the anchors that have been challenged or extended in post-cutoff literature.
6. Produces an annotated bibliography organized by anchor section, tagged by subfield concept.

**If "Your Anchors" is empty,** `/discover anchor` will halt and prompt you to add at least one anchor — either by editing this file directly or by running `/discover interview`, which asks for anchors as part of the conversation.

---

## Adding an anchor

Two ways:

**Conversational:** Just run `/discover interview` — the interview asks what review documents you want to anchor your search on. It then appends them to "Your Anchors" above automatically.

**Manual:**
1. Pick a citation key (snake_case, e.g., `nca5_ch19_economics`, `nordhaus_ar_2019`).
2. Add a row to "Your Anchors" above with: source, scope, cutoff date, URL or cache path.
3. Add a matching BibTeX entry to `Bibliography_base.bib`.
4. If the anchor is a PDF you have locally, drop it into `cache/` so the librarian can read it without re-fetching.

---

## When anchors aren't enough

Some lit searches benefit from going beyond the anchors' reach. The librarian-critic flags when the bridge search hugs the anchor too closely without bringing in subfield-native literature. If you find the anchor set isn't producing useful breadth, add more anchors, or fall back to standalone `/discover lit [topic]` for a non-anchored search.
