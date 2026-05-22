# NCA6 Coauthor Guide — Step by Step

This guide walks you through using this template to produce your NCA6 chapter contribution. **No prior Claude Code experience required** — sections are tagged so experienced users can skip ahead.

---

## Part 1 — What this template does

You are an economist contributing a section to an NCA6 chapter. Your subfield (labor, health, trade, public, IO, macro, development, environmental, finance, or other) gives you a lens. This template helps you:

1. **Articulate your lens** in a short conversation (`/discover interview`).
2. **Run a bridge literature search** that connects your subfield to the climate-economics anchors that frame the chapter (`/discover anchor`).
3. **Draft your NCA6 section** using the standardized chapter scaffold (Key Messages, Evidence Base, Uncertainties, Confidence, Likelihood, Traceable Accounts).
4. **Get critic feedback** on your output at every stage (each creator agent has a paired critic).

### What is an anchor?

An anchor is a review-style document — typically a chapter from NCA5, IPCC AR6, or a major *Handbook* or JEL survey — that provides five things:

1. **Prior state of knowledge** at its cutoff date
2. **Seed citations** to start your forward-snowball search from
3. **Claim list** — testable statements that may now be stale
4. **Confidence/likelihood vocabulary** (NCA/IPCC standard, required in NCA6)
5. **Scope frame** — what's in and out

The template does **not** ship with a pre-loaded anchor set — you decide which review documents anchor your slice. The interview (next part) walks you through choosing. Examples you might consider: chapters of NCA5 (Ch.19 Economics) and IPCC AR6 (WG2 Ch.16/17, WG3 Ch.3/13/15), IPCC SR1.5, *Annual Review of Resource Economics* surveys, *Journal of Economic Literature* surveys, NBER review chapters, *Handbook of Environmental Economics* volumes. `master_supporting_docs/anchors/anchor-index.md` lists more examples.

---

## Part 2 — Setup (first-time users)

> *Experienced users: skip to Part 3.*

### 2.1 Install Claude Code

Claude Code is a CLI tool that runs in your terminal. Install with Node.js (you'll need Node 18+):

```bash
npm install -g @anthropic-ai/claude-code
```

If you don't have Node.js: install it from [nodejs.org](https://nodejs.org/) (LTS version is fine), then run the command above.

Verify it works:

```bash
claude --version
```

You'll be prompted to sign in the first time you run `claude`. You'll need an Anthropic account (sign up at [console.anthropic.com](https://console.anthropic.com)) or a Claude.ai Pro/Max subscription.

### 2.2 Install the GitHub CLI

For forking and committing:

```bash
# macOS
brew install gh

# Linux
sudo apt install gh        # Debian/Ubuntu
sudo dnf install gh        # Fedora/RHEL

# Windows
winget install GitHub.cli
```

Then sign in:

```bash
gh auth login
```

### 2.3 Install LaTeX (only needed if you'll compile the chapter locally)

If you only plan to write text and let someone else compile, skip this — you can also use Overleaf.

```bash
# macOS
brew install --cask mactex-no-gui

# Linux
sudo apt install texlive-xetex texlive-fonts-extra texlive-latex-extra latexmk
```

---

## Part 3 — Fork and open the repo

```bash
gh repo fork ArielOrtizBobea/nca6-econ-template --clone
cd nca6-econ-template
```

The first time you run `claude` inside the repo, it reads `CLAUDE.md` automatically.

```bash
claude
```

You're now in an interactive session. Type messages naturally; Claude responds and can run tools (with your permission).

---

## Part 4 — Fill in your basics (5 minutes)

Open `CLAUDE.md` in your editor (or ask Claude to do it):

```
edit CLAUDE.md to fill in my name and institution
```

Set:
- `NCA6 chapter:` (the lead coauthor should have told you which chapter)
- `Coauthor (you):` your name
- `Institution:` your institution

Leave `Econ subfield:` blank for now — the interview will fill it in.

---

## Part 5 — Run the interview (10–15 minutes)

```
/discover interview
```

Claude will have a short conversation with you about:

- **Your econ subfield and methods** (one or two papers that represent your recent work)
- **The slice of climate-economics you want to contribute** to this chapter
- **What's in vs. out** of your scope (so we don't duplicate or leave gaps)
- **Your anchors** — which review documents (NCA5 chapters, IPCC AR6 chapters, *Annual Review* articles, *JEL* surveys, NBER reviews, *Handbook* chapters) define the climate-economics scope for your contribution. You can give URLs or drop PDFs into `master_supporting_docs/anchors/cache/`.
- **Specific surfacing requests** — anything you suspect is missing or stale

After 6–8 exchanges, Claude proposes an "aspect spec." Read it carefully. If something's off, say so — Claude revises. When you're happy:

```
yes save it
```

It saves to `quality_reports/aspect_spec_[you].md`.

---

## Part 6 — Run the bridge anchor search

```
/discover anchor
```

This dispatches the Librarian in **Bridge Anchor Mode**. Claude:

1. Loads your aspect spec
2. Fetches the relevant anchors (cached in `master_supporting_docs/anchors/cache/`)
3. Weights each anchor by relevance to your subfield
4. Extracts seed citations from each anchor's bibliography
5. Forward-cites from those seeds since the anchor's cutoff date
6. Filters to the intersection of your subfield × the anchor scope
7. Flags claims in the anchors that have been confirmed, extended, contested, or remain open since cutoff
8. Surfaces 3–5 papers from adjacent subfields you may not be tracking

The output lives in `quality_reports/literature/[you]/`:

| File | Purpose |
|------|---------|
| `bridge_review.md` | Annotated bibliography, organized by anchor section, tagged by your subfield concept |
| `references.bib` | BibTeX (entries marked `% UNVERIFIED` could not be confirmed and should be checked manually) |
| `staleness_flags.md` | Anchor claims labeled `CONFIRMED` / `EXTENDED` / `CONTESTED` / `OPEN` with supporting evidence |
| `adjacent_surfacing.md` | Papers from adjacent subfields worth your attention |
| `frontier_map.md` | Where the bridge stands now |
| `positioning.md` | Suggested framing for your NCA6 contribution given the bridge state |

The Librarian then gets reviewed by the librarian-critic (Mode B checks: anchor coverage, bridge discipline, forward-citation completeness, staleness work, output structure). If the score is below 80, you'll see exactly what's weak and can ask Claude to re-run with corrections.

---

## Part 7 — Draft your NCA6 section

The chapter is in `paper/main.tex`. Per-coauthor contributions live in `paper/sections/contributions/`. To start your section:

```bash
cp paper/sections/contributions/_template.tex paper/sections/contributions/[your-topic].tex
```

(Or ask Claude to do it.)

The template has slots for:

- **Key Messages (KMs)** — your top-line claims with confidence and likelihood labels
- **Description of Evidence Base** — what the literature shows, per KM
- **Major Uncertainties** — what's not yet known
- **Description of Confidence** — *why* you assign the confidence level you do
- **Description of Likelihood** — *why* you assign the likelihood (when probabilistic)
- **Traceable Accounts** — the evidence chain from claim to source literature

Use `\input{paper/sections/contributions/[your-topic].tex}` in `main.tex` once you're ready to include it.

For drafting help:

```
/write [your section name]
```

---

## Part 8 — Iterate, commit, share

After each round of work:

```bash
# Compile to check it builds (optional — only if LaTeX installed)
cd paper && latexmk main.tex

# Commit
git add -A
git commit -m "Add bridge lit review for [my topic]"
git push
```

Or ask Claude:

```
commit my changes
```

---

## Frequently asked questions

**Q: I'm not sure my subfield maps cleanly to the pre-loaded anchors. What do I do?**
A: Run `/discover interview` first — Claude will help you articulate your slice and identify which anchors fit. You can also add your own anchors (any subfield handbook, JEL survey, or *Annual Review* article) to `master_supporting_docs/anchors/anchor-index.md`. The interview also asks you about this.

**Q: The bridge search returned papers I disagree with or missed papers I expected. How do I correct it?**
A: Tell Claude. Mention the specific paper or category that's wrong; Claude can re-run targeted searches, ask the librarian to revisit specific anchors, or add papers manually. The librarian-critic will also flag this kind of issue.

**Q: I want to do my own empirical analysis as part of the contribution, not just a lit review. Is this template OK for that?**
A: Yes — the analysis machinery (`/strategize`, `/analyze`, `/write`) inherits from the underlying clo-author scaffold. After your lit review is in place, you can run those skills the same way you would on any econ project.

**Q: I already have a lit review draft elsewhere. Can I import it instead of running `/discover anchor`?**
A: Yes — drop it into `quality_reports/literature/[you]/bridge_review.md` (and `references.bib`) manually. The librarian-critic can still review what you have. But running `/discover anchor` against your existing draft is often useful as a check — it surfaces what your draft may have missed.

**Q: How long should my contribution be?**
A: Ask the lead coauthor. NCA6 chapters typically have several Key Messages per coauthor, with 2–4 pages of supporting text each. Your `paper/sections/contributions/[you].tex` should reflect that scope.

**Q: I made a mistake / want to start over.**
A: Delete `quality_reports/aspect_spec_[you].md` and `quality_reports/literature/[you]/`, then re-run `/discover interview` and `/discover anchor`. Your `Bibliography_base.bib` additions are preserved.

---

## Where to get help

- Read `CLAUDE.md` for the project-level overview
- Read `.claude/rules/workflow.md` for how the agent pipeline works
- Read `master_supporting_docs/anchors/README.md` for the anchor explainer
- Ask Claude directly: "explain how `/discover anchor` works"
- Ask your lead coauthor for chapter-level questions (which KMs, length, deadlines)
