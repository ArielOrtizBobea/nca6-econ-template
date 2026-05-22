# NCA6 Economist-Coauthor Template

A Claude Code scaffold for **economists writing literature-review contributions to NCA6 chapters**. Bridges the coauthor's econ subfield (labor, health, trade, public, IO, macro, development, environmental, finance, ...) with the climate-economics anchors (NCA5 Ch.19, IPCC AR6 econ chapters, plus any anchors the coauthor adds).

**The core idea:** your literature search starts from an authoritative anchor, not from a blank query. The anchor gives you the prior state of knowledge, seed citations, claim list, NCA/IPCC vocabulary, and scope frame. The new `/discover anchor` skill intersects this with your econ subfield to surface the *bridge* — what a labor economist, or a trade economist, or a public economist actually needs to read to contribute their lens to NCA6.

---

## Quickstart (if you already use Claude Code)

```bash
# Fork the template and clone your fork
gh repo fork ArielOrtizBobea/nca6-econ-template --clone
cd nca6-econ-template

# Open Claude Code
claude
```

Then:

```
/discover interview          # two-axis conversation: your subfield + your slice
/discover anchor             # bridge literature search
```

Outputs land in `quality_reports/literature/[you]/`. Done in two commands.

---

## New to Claude Code? Read the guide

If this is your first time, open **[NCA6_COAUTHOR_GUIDE.md](NCA6_COAUTHOR_GUIDE.md)** — it walks you through:

- Installing Claude Code
- Forking and opening the repo
- Running the interview and anchor commands
- Reviewing the output
- Drafting your NCA6 section

The guide assumes no prior experience. It also explains what an anchor is and why this template works the way it does.

---

## What this template provides

- **Two-axis interview** (`/discover interview`) — captures your econ subfield and your chosen climate-economics slice, and asks which review documents you want to anchor your search on. Saves to an aspect spec.
- **Bridge anchor search** (`/discover anchor`) — runs the Librarian in Bridge Anchor Mode: weighted use of your anchors, forward-citation snowball from seed citations, claim-staleness flags, adjacent-subfield surfacing.
- **Coauthor-supplied anchors** — the template does not pre-load a canonical anchor set. You decide which review documents (NCA5 chapters, IPCC AR6 chapters, *Annual Review* surveys, JEL surveys, NBER chapters, *Handbook* volumes) anchor your slice. The interview makes adding them easy; see [`master_supporting_docs/anchors/anchor-index.md`](master_supporting_docs/anchors/anchor-index.md) for examples to consider.
- **NCA6 chapter scaffold** — `paper/sections/contributions/_template.tex` carries Key Messages + Description of Evidence Base + Major Uncertainties + Description of Confidence + Description of Likelihood + Traceable Accounts. Multi-coauthor chapter shell in `paper/main.tex`.
- **Worker-critic quality gates** — every creator agent (Librarian, Writer, Coder) has a paired critic. Nothing ships below 80/100. See [`.claude/rules/quality.md`](.claude/rules/quality.md).
- **General-economics fallback** — `/discover lit [topic]` and the standard research pipeline still work if your task isn't anchor-driven.

---

## Folder structure

```
.
├── CLAUDE.md                    # Project instructions Claude reads each session
├── NCA6_COAUTHOR_GUIDE.md       # Step-by-step onboarding
├── README.md                    # This file
├── .claude/                     # Agents, skills, rules, references, hooks
├── Bibliography_base.bib        # Bibliography (sync canonical + add your own)
├── paper/                       # NCA6 chapter manuscript
│   ├── main.tex                 # Chapter shell
│   ├── sections/contributions/  # Per-coauthor sections
│   └── ...
├── master_supporting_docs/anchors/
│   ├── README.md                # What is an anchor + how to add yours
│   ├── anchor-index.md          # Pre-loaded + coauthor-supplied anchors
│   └── cache/                   # Fetched anchor content (gitignored)
├── quality_reports/             # Aspect specs, lit output, reviews
├── scripts/                     # Optional analysis code
└── data/                        # Optional data (raw/ and cleaned/)
```

---

## Prerequisites

| Tool | Required for | How |
|------|--------------|-----|
| [Claude Code](https://docs.claude.com/en/docs/claude-code) | The workflow itself | `npm install -g @anthropic-ai/claude-code` |
| [gh CLI](https://cli.github.com/) | Forking and committing | `brew install gh` (macOS) |
| XeLaTeX | Paper compilation | [TeX Live](https://tug.org/texlive/) or [MacTeX](https://tug.org/mactex/) |

Optional: R/Python/Julia for analysis, [Quarto](https://quarto.org) for slides.

---

## What an anchor is

An anchor is a review-style document — usually a chapter from NCA5, IPCC AR6, or a major handbook/JEL survey — that drives your literature search by providing:

1. **Prior state of knowledge** at the cutoff date
2. **Seed citations** for forward-snowball
3. **Claim list** testable against post-cutoff lit
4. **Confidence/likelihood vocabulary** (NCA/IPCC standard)
5. **Scope frame**

Without an anchor your search is unfocused. With one, it's directional. See [`master_supporting_docs/anchors/README.md`](master_supporting_docs/anchors/README.md) for the full explainer and instructions on adding subfield-specific anchors.

---

## License

MIT. Fork, customize, share.

---

## Origin and related work

Built on the [clo-author](https://github.com/hugosantanna/clo-author) scaffold (Hugo Sant'Anna), which itself builds on Pedro Sant'Anna's [claude-code-my-workflow](https://github.com/pedrohcgs/claude-code-my-workflow). This template specializes those general-research-workflow tools for NCA6 economist coauthors via the anchor-driven bridge search.
