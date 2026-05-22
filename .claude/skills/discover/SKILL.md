---
name: discover
description: Discovery phase combining research interviews, literature search, anchor-driven bridge search (for NCA6 coauthors), data discovery, and ideation. Routes to appropriate agents based on arguments.
argument-hint: "[mode: interview | lit | anchor | data | ideate] [topic or query]"
allowed-tools: Read,Grep,Glob,Write,Edit,WebSearch,WebFetch,Task
---

# Discover

Launch the Discovery phase of research. Routes to the appropriate agents based on the mode specified.

**Input:** `$ARGUMENTS` — a mode keyword followed by a topic or query.

---

## Modes

### Default (no mode specified)

If no mode keyword is given:
- If `master_supporting_docs/anchors/anchor-index.md` exists AND no `quality_reports/aspect_spec_*.md` exists, this is likely an NCA6 coauthor on their first run — load `interview-nca6.md` from this skill directory and follow its NCA6 interview protocol.
- Otherwise, start with the standard interactive interview below.

### `/discover interview [topic]` — Research Interview

**NCA6 coauthor variant:** If `master_supporting_docs/anchors/anchor-index.md` exists, this template is configured for NCA6 economist coauthors. Load `interview-nca6.md` from this directory and follow its two-axis interview protocol. The output is an aspect spec (subfield + climate-economics slice) saved to `quality_reports/aspect_spec_[coauthor].md` — the input to `/discover anchor`.

**Standard variant (non-NCA6):** Conduct a structured conversational interview to formalize a research idea.

**This is conversational.** Ask questions directly in your text responses, one or two at a time. Wait for the user to respond before continuing. Do NOT use AskUserQuestion.

**Agents:** Direct conversation (no agent dispatch)
**Output:** Research specification + domain profile

Standard interview structure:
1. **Big Picture** (1-2 questions): "What phenomenon are you trying to understand?" "Why does this matter?"
2. **Theoretical Motivation** (1-2 questions): "What's your intuition for why X happens?" "What would standard theory predict?"
3. **Data and Setting** (1-2 questions): "What data do you have access to?" "Is there a specific institutional setting?"
4. **Identification** (1-2 questions): "Is there a natural experiment or policy change you can exploit?" "What's the biggest threat to causal interpretation?"
5. **Expected Results** (1-2 questions): "What would you expect to find?" "What would surprise you?"
6. **Contribution** (1 question): "How does this differ from what's been done? What gap are you filling?"

Interview style:
- **Be curious, not prescriptive.** Draw out the researcher's thinking, don't impose your own ideas.
- **Probe weak spots gently.** "What would a skeptic say about...?" not "This won't work because..."
- **Build on answers.** Each question should follow from the previous response.
- **Know when to stop.** If the researcher has a clear vision after 4-5 exchanges, move to the specification.

After interview (5-8 exchanges), produce three outputs:

**Output 1: Research Specification** → `quality_reports/research_spec_[topic].md`
```markdown
# Research Specification: [Title]
## Research Question — [one sentence]
## Motivation — [why this matters, theoretical context, policy relevance]
## Hypothesis — [testable prediction with expected direction]
## Empirical Strategy — [method, treatment, control, identifying assumption, robustness]
## Data — [primary dataset, key variables, sample, unit of observation]
## Expected Results — [what the researcher expects and why]
## Contribution — [how this advances the literature]
## Open Questions — [issues needing further thought]
```

**Output 2: Domain Profile** → `.claude/references/domain-profile.md` (if still template)
Fill in field, target journals, common data sources, identification strategies, field conventions, seminal references, and referee concerns based on the interview.

**Output 3: Decision Record** → `quality_reports/decisions/discovery_[topic].md`
Using `templates/decision-record.md`, record:
- **Decision:** The research question chosen
- **Alternatives:** Other angles, framings, or questions that came up during the interview
- **Why rejected:** For each alternative, why this framing was preferred (scope, data availability, novelty, feasibility)
- **Key assumptions:** What must hold for this question to be answerable
- **What would invalidate:** What would force a pivot (e.g., "if the policy change turns out to have been anticipated")

### `/discover lit [topic]` — Literature Review
Search and synthesize academic literature.

**Agents:** Librarian (collector) → librarian-critic (reviewer)
**Output:** Annotated bibliography + BibTeX entries + frontier map

Workflow:
1. Read `.claude/references/domain-profile.md` for field journals and seminal references
2. Check `master_supporting_docs/` for uploaded papers
3. Read `bibliography_base.bib` for papers already in the project
4. Dispatch Librarian to search:
   - Top-5 journals (AER, Econometrica, QJE, JPE, REStud)
   - Field journals from domain-profile.md
   - NBER/SSRN/IZA working papers
   - **Citation chains** — forward and backward citation tracking from key papers. Follow: (a) backward citations (what do the key papers cite?), and (b) forward citations (who cites the key papers?). This is often the most productive search vector.
5. Assign **proximity scores** to each paper:
   - **1** — Directly competes (same question, similar method)
   - **2** — Closely related (same question, different method or setting)
   - **3** — Related (overlapping topic, different angle)
   - **4** — Background (provides theory, method, or context)
   - **5** — Tangentially related (useful framing only)
6. Dispatch librarian-critic to check coverage, gaps, recency, scope
7. If gaps found, re-dispatch Librarian for targeted search (max 1 round)
8. Save to `quality_reports/lit_review_[topic].md`

**Unverified citations:** If you cannot verify a citation, mark the BibTeX entry with `% UNVERIFIED`. Do NOT fabricate or guess citation details. Note when working papers have been published — cite the published version.

Output format for each paper:

```markdown
### [Author (Year)] — [Short Title]
- **Journal:** [venue]
- **Proximity:** [1-5 score]
- **Main contribution:** [1-2 sentences]
- **Identification strategy:** [DiD / IV / RDD / SC / descriptive]
- **Key finding:** [result with effect size]
- **Relevance:** [why it matters for our research]
```

### `/discover anchor` — Bridge Anchor Literature Search (NCA6 coauthors)

Run a bridge-aware literature search anchored on review documents (NCA5 econ chapter, IPCC AR6 econ chapters, and any coauthor-supplied anchors). This mode is the canonical entry point for an NCA6 economist coauthor.

**Agents:** Librarian in Bridge Anchor Mode → librarian-critic (Mode B checks)

**Inputs (auto-discovered, no args needed in the common case):**
- `quality_reports/aspect_spec_[coauthor].md` — produced by `/discover interview`
- `master_supporting_docs/anchors/anchor-index.md` — pre-loaded + coauthor-supplied anchors
- `.claude/references/domain-profile.md` — Bridge Reference Table and NCA vocabulary
- `Bibliography_base.bib` — existing citations

**Output:** `quality_reports/literature/[coauthor]/` containing:
- `bridge_review.md` — annotated bibliography organized by anchor section
- `references.bib` — BibTeX (unverified entries marked `% UNVERIFIED`)
- `staleness_flags.md` — anchor claims with `CONFIRMED` / `EXTENDED` / `CONTESTED` / `OPEN` labels
- `adjacent_surfacing.md` — papers from adjacent subfields the coauthor may not be tracking
- `frontier_map.md` — where the bridge stands now
- `positioning.md` — suggested framing for the NCA6 contribution

**Protocol:** Load `anchor-mode.md` from this skill directory and follow it. The full orchestration — pre-flight checks, anchor weighting, Librarian dispatch prompt, critic loop — lives there.

**Pre-flight failure:** If no aspect spec exists, halt and instruct:
> "No aspect spec found. Run `/discover interview` first — that elicits your subfield and chosen slice. Then re-run `/discover anchor`."

### `/discover data [requirements]` — Data Discovery
Find and assess datasets for the research question.

**Agents:** Explorer (finder) → explorer-critic (assessor)
**Output:** Ranked data sources with feasibility grades

Workflow:
1. Read research spec and strategy memo if they exist
2. Read `.claude/references/domain-profile.md` for common data sources in the field
3. Understand what variables are needed: treatment, outcome, controls, time period, geography
4. Dispatch Explorer to search across source categories:
   - Public microdata (CPS, ACS, NHIS, MEPS, etc.)
   - Administrative data (Medicare claims, tax records, court records)
   - Survey data (RAND HRS, PSID, Add Health, NLSY)
   - International (World Bank, OECD, Eurostat)
   - Novel/alternative (satellite imagery, web scraping, proprietary)
5. For each dataset found, report:
   - Name, provider, access level (public/restricted)
   - Key variables available
   - Coverage (time period, geography, sample size)
   - **Feasibility grade:**
     - **A** — Ready to use (public download, documented, standard format)
     - **B** — Accessible with effort (application required, moderate cost, needs cleaning)
     - **C** — Restricted but obtainable (FSRDC, data use agreement, IRB approval)
     - **D** — Very difficult (proprietary, requires partnership, rare access)
   - Strengths and limitations
6. Dispatch explorer-critic to critique each proposed dataset using the **5-point assessment:**
   1. **Measurement validity** — Does the variable actually measure what we need?
   2. **Sample selection** — Who is in the data? Who is missing?
   3. **External validity** — Can we generalize from this sample?
   4. **Identification compatibility** — Does this data support the proposed design?
   5. **Known issues** — Documented problems with this dataset in the literature
7. Save exploration to `quality_reports/data_exploration_[topic].md`

**Rejected datasets:** Include a rejection table:

| Dataset | Reason for Rejection | Deal-breaker? |
|---------|---------------------|---------------|
| [Name]  | [explorer-critic's finding] | [Yes/No] |

### `/discover ideate [topic]` — Research Ideation
Generate structured research questions and hypotheses from a topic or dataset.

**Agents:** Direct generation (no agent dispatch)
**Output:** Research questions with empirical strategies

Generate:
1. 3-5 research questions with clear hypotheses
2. For each: potential identification strategy, data requirements, expected contribution
3. Rank by feasibility and novelty
4. Save to `quality_reports/research_ideas_[topic].md`

---

## Principles

- **Interview style:** Be curious, not prescriptive. Draw out the researcher's thinking.
- **Literature honesty:** Never fabricate citations. Mark unverified as `% UNVERIFIED`.
- **Proximity scoring:** Always assign 1-5 proximity scores to papers found.
- **Citation chains:** Forward and backward citation tracking is an explicit search vector — do not skip it.
- **Effect sizes matter:** Report magnitudes, not just signs. Note identification strategy for every paper.
- **Data feasibility matters:** A perfect dataset you can't access is useless. Always assign A/B/C/D grades.
- **5-point data critique:** Measurement validity, sample selection, external validity, identification compatibility, known issues. Never skip this.
- **Domain-profile aware:** Always read `.claude/references/domain-profile.md` first for field calibration.
- **Worker-critic pairing:** Librarian + librarian-critic, Explorer + explorer-critic. Never skip the critic.
- **Bridge discipline (anchor mode):** In `/discover anchor`, every paper must connect the coauthor's subfield to the anchor scope. Generic subfield work without climate content, and generic climate work without subfield engagement, both fail the bridge test.
- **Anchor honesty:** If an anchor URL cannot be fetched, note the gap in the output. Do not fabricate anchor content or invent claims attributed to anchors.
