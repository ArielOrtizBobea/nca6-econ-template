# Literature Review — [TOPIC]

**Status:** EXAMPLE — replace with your own.
**Created:** YYYY-MM-DD
**Reviewer:** [your name or `librarian` agent]
**Scope:** [e.g., "Papers since 2015 on the causal effect of X on Y, with focus on identification strategy and external validity."]

---

## How to Use This File

This file is a stub showing the expected format for a literature review output produced by the `librarian` agent (or written by hand). Replace every section with your own content, or invoke `/discover literature [topic]` to have the agent generate one.

The companion `librarian-critic` agent will score this document against `.claude/rules/quality.md`. Keep the headers below — the critic uses them as anchor points.

---

## 1. Research Question

State the question this review serves. One paragraph. The question, not the topic.

## 2. Search Strategy

- **Databases / engines:** [e.g., Google Scholar, Web of Science, NBER, SSRN]
- **Date range:** [e.g., 2010–present]
- **Keyword stems and Boolean structure:** [e.g., `("minimum wage" OR "wage floor") AND ("employment" OR "hours")`]
- **Inclusion criteria:** [e.g., peer-reviewed or NBER working paper, English, empirical (not theoretical-only)]
- **Exclusion criteria:** [e.g., review articles, dissertations]
- **Stop rule:** [e.g., saturation — last three searches surfaced no new relevant papers]

## 3. Annotated Bibliography

Group papers by theme. For each entry, provide:
- Full citation
- One-paragraph summary (research question, data, method, key finding)
- Identification strategy and credibility
- Relevance to this project

### Theme A: [Name]

**Author, A. and Author, B. (Year). "Title." *Journal* Volume(Issue): pp.**

[One paragraph: what they did, what they found.]

*Identification:* [DID / IV / RDD / structural / descriptive]. *Strength of design:* [high / medium / low — and why].

*Relevance:* [How this paper informs your project. What you take from it. What gap remains.]

### Theme B: [Name]

[Repeat structure.]

## 4. Synthesis

What does the body of work tell us collectively? Where is there consensus? Where is there disagreement? What methodological patterns dominate?

## 5. Gaps and Contribution

Be specific. "Existing work is limited" is not a gap. State which empirical question, population, or context has not been addressed, and why filling that gap is non-trivial.

## 6. Implications for Project Design

Translate the review into design decisions: which dataset, which identification strategy, which robustness checks, which placebo tests. The review should constrain the project, not just describe the field.

---

## Notes for Critics

The `librarian-critic` agent scores this document on:
- Coverage (have the key papers been found?)
- Recency (are post-2020 contributions included where they exist?)
- Critical engagement (are papers summarized or genuinely evaluated?)
- Synthesis (does the review add up to a coherent picture?)
- Actionability (do the gaps translate to project design?)

See `.claude/agents/librarian-critic.md` for the full rubric.
