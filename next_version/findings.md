# Findings & Decisions

## Requirements
- Truthful, hiring-manager-readable positioning: `Product Engineer` + `Flutter/Dart cross-platform` + `M.Sc. Computational Linguistics (ML/DL/NLP)` as primary.
- Re-audit **all** copy on the current homepage (and linked pages) for emphasis/order and factual support; keep awards/certs where they strengthen credibility.
- Re-organize the site to tell a clear story + provide an easy-to-skim resume, with clear CTAs: download CV, contact, links.
- Design target: “Material 3 expressive” influence, subtle (not loudly “Material”), premium/simple.
- Make the next iteration composable: content/sections easy to rearrange; CSS split into manageable files (LLM-friendly).
- Work incrementally in `next_version/` until direction is locked.

## Research Findings
- Current root homepage (`index.html`) still uses a hero headline of “Fast. Beautiful. Accessible.” which reads like a product tagline, not a personal positioning line.
- Current skill grouping still surfaces `React/Next.js` prominently in multiple places (e.g., skills list and PDF snippet), which conflicts with the intended Flutter-first story.
- Existing in-repo design variants:
  - `flutter/index.html` is already closer to the desired “Flutter-first” visual language (dark zinc + neon accent, asymmetry, code motif).
  - `frontend/index.html` exists but emphasizes a broader “frontend engineering” positioning and includes outdated metrics copy.
- `.cursor/rules/use-distinctive-color.mdc` recommends avoiding “default” Tailwind blues/purples and using a dominant/supporting/accent scheme; it’s guidance, not a literal palette.
- `.cursor/rules/use-purposeful-layout.mdc` supports the desired direction: asymmetric hierarchy (60/40), dominant hero, decisive whitespace.
- `jhp-next` repo confirms the photography case study stack: Next.js 14 (App Router) + TypeScript + Tailwind + shadcn/ui + Azure Container Apps (ACR) + GitHub Actions CI/CD.
- `configs/librechat.yaml` in `/Users/jholt/Documents/librechat-setup` confirms the currently configured Azure AI Foundry models and that Claude is not currently configured (tested previously, now removed).
  - Chat/coding models include `gpt-5.2`, `gpt-5.2-chat`, `gpt-5-pro`, `gpt-5.2-codex`, and `gpt-5-mini`.
  - Serverless models include `Mistral-Large-3`, `mistral-medium-2505`, `DeepSeek-R1-0528`, `MAI-DS-R1`, `Kimi-K2-Thinking`.
  - Config contains Azure resource identifiers; case studies should avoid publishing those.

## Technical Decisions
| Decision | Rationale |
|----------|-----------|
| Keep `next_version/` as the working area | Avoid breaking the currently deployed site while iterating on narrative/design. |
| Prefer “tokens + components” CSS split | Improves composability and makes edits easier (human + LLM). |

## Issues Encountered
| Issue | Resolution |
|-------|------------|
| `frontend/content_strategy.md` referenced in editor context but missing in repo | Treat as unavailable; re-derive content strategy from inventory docs + current pages. |

## Resources
- `docs/professional_inventory_update.md`
- `professional-inventory.md`
- `.cursor/rules/use-purposeful-layout.mdc`
- `.cursor/rules/use-distinctive-color.mdc`
- `.cursor/rules/ux-patterns.mdc`
