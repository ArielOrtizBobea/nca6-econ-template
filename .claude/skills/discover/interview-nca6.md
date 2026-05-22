# NCA6 Coauthor Interview — Two-Axis Aspect Spec

> Loaded on demand by `discover/SKILL.md` when the user invokes `/discover interview` in this template. This file holds the NCA6-tuned interview prompts and the output format.

---

## Purpose

This interview elicits a coauthor's **aspect spec** — a short, structured document that pins down:

1. **Axis 1 — Econ subfield:** which subfield the coauthor is bringing (labor / health / trade / public / IO / macro / development / environmental / finance / other), what methods they use, what their recent work looks like.
2. **Axis 2 — Climate-economics slice:** which slice of the chapter's territory they want to contribute, what's in vs. out of their contribution, how it connects to the anchors.

Optionally, the coauthor can suggest additional anchors beyond the pre-loaded set.

The output file (`quality_reports/aspect_spec_[coauthor].md`) is the input to `/discover anchor`.

---

## Interview Style

- **Conversational, not a form.** Ask one or two questions at a time. Wait for the reply. Build on each answer.
- **Be a colleague, not an interviewer.** Use "we" sparingly; never pretend to be on the chapter team. Be a curious peer.
- **Probe softly when answers are vague.** "Can you give me a concrete example of a paper in this area you'd most want to extend?"
- **Know when to stop.** If after 6–8 exchanges you have enough to fill the spec, propose the spec rather than asking more questions.
- **Do NOT use AskUserQuestion.** This is a text conversation. AskUserQuestion is for forced-choice clarifications, which this isn't.

---

## Suggested Question Arc

### Opening (1 question)

"Welcome. This template helps NCA6 coauthors run a bridge literature search — pulling together your econ specialty with the climate-economics anchors that frame the chapter. To start: what's your econ background? Subfield, the kind of methods you tend to use, and one or two papers that represent your recent work."

### Axis 1: Subfield (1–2 questions)

After their reply, probe as needed:
- "Got it. Which journals do you read most in this subfield?" (Surfaces venues, helps the librarian target the search.)
- If their work is methods-heavy: "What's a method you think is underused in climate-economics that you'd bring?"
- If their work is empirical: "What kind of identification do you typically rely on — natural experiments, structural, descriptive?"

### Axis 2: Climate-economics slice (2–3 questions)

- "What slice of climate-economics do you most want to contribute to in this chapter? It can be broad ('labor supply responses to climate'), or narrow ('heat-stress effects on agricultural worker productivity in low-income countries')."
- After their reply: "What's in your slice? What's *out*?" (Forces a boundary.)
- "Is there a specific anchor — NCA5 Ch.19, or one of the IPCC AR6 chapters — that you already feel speaks to your slice? Or that you think misses something important?"

(If they don't know the anchors yet, give a one-line description of each and let them point.)

### Anchor augmentation (1 question)

"Beyond the pre-loaded anchors (NCA5 Ch.19, IPCC AR6 WG2 Ch.16/17, WG3 Ch.3/13/15, SR1.5), are there review documents in your subfield you want to add as anchors? Examples: a *Handbook of Environmental Economics* chapter, a JEL survey, an *Annual Review of Resource Economics* article, an NBER review."

If yes, capture: full citation, why it matters, URL or cache path.

### Closing (1 question)

"Last thing — what do you most want this lit search to surface? Is there a specific gap you suspect exists, a claim from the anchors you suspect is now stale, or a body of work you want me to make sure is fully covered?"

---

## When You Have Enough

After 6–8 exchanges, propose the aspect spec. Format:

```markdown
# Aspect Spec — [Coauthor Name or Initials]

**Date:** YYYY-MM-DD
**Status:** [DRAFT — pending coauthor sign-off | APPROVED]

## Axis 1: Econ Subfield

**Primary subfield:** [labor / health / trade / public / IO / macro / development / environmental / finance / other]
**Methods footprint:** [reduced-form panel / structural / IAM / theory / descriptive / other — pick what fits]
**Representative recent work:** [1–2 of their papers, full citations]
**Reading footprint:** [journals they read most]

## Axis 2: Climate-Economics Slice

**Slice description:** [one paragraph — the specific bridge they will contribute]
**In scope:** [bullet list of what's in]
**Out of scope:** [bullet list of what's deliberately left to other coauthors or to the chapter at large]
**Anchor alignment:** [which pre-loaded anchors are most relevant to this slice, and why]

## Coauthor-Supplied Anchors

[If they suggested any during the interview, list them here. Otherwise: "None added."]

| Citation key | Source | Why | URL or cache path |
|--------------|--------|-----|-------------------|

## Search Priorities

**Surfacing requests:** [things they specifically want surfaced]
**Suspected stale claims:** [anchor claims they suspect are now contested]
**Methods to highlight:** [methods they want emphasized in the bridge search]

---

*This spec is the input to `/discover anchor`. To update, re-run `/discover interview`.*
```

Show the spec to the coauthor. Ask for confirmation:
> "Does this capture your contribution accurately? Anything to revise or add before I save it?"

After they confirm:

1. Save to `quality_reports/aspect_spec_[coauthor].md` (use lowercase, hyphens for spaces in coauthor name).
2. If they listed coauthor-supplied anchors, append them to the "Coauthor-Supplied Anchors" table in `master_supporting_docs/anchors/anchor-index.md`.
3. Tell them the next step:
   > "Spec saved. Run `/discover anchor` next — it will read this spec, pull the relevant anchors, and produce a bridge-filtered annotated bibliography."

---

## When NOT to write the spec

- If the coauthor's answers are still vague after 8 exchanges, say so explicitly: "I'm not sure I have enough to nail down your slice. Want to give me a paper or two that represent the work you'd most want to extend in this chapter?" Don't force a vague spec.
- If the coauthor is mid-thought ("I'm not sure yet — give me a day"), don't write a draft spec. Just save the conversation context to `quality_reports/aspect_spec_[coauthor]_DRAFT.md` and tell them to re-run when ready.

---

## Fallback to standard interview

If the coauthor isn't writing for NCA6 — e.g., they're using this template for a regular econ paper — fall back to the standard interview structure in `discover/SKILL.md`. You can detect this by asking the opening question; if their answer doesn't fit "NCA6 economist coauthor," ask "Are you writing this for the NCA6 chapter or for a different output?" If different, use the standard interview.
