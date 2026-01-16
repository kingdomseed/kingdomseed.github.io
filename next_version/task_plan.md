# Task Plan: AI-Powered Portfolio (React/Next.js) + Basic Static Fallback

## Goal
Build a React/Next.js portfolio that acts as an “interface layer” over Jason’s real experience: resume + case studies + queryable AI context + honest JD fit assessment, while maintaining a simple one-page HTML/CSS fallback for GitHub Pages.

## Current Phase
Phase 1

## Phases

### Phase 1: Requirements & Discovery
- [x] Choose direction: **A3 (React/Next.js)**, no Lovable
- [x] Capture initial audits (copy/hierarchy) in `next_version/`
- [x] Record initial palette direction: **C1**
- **Status:** complete

### Phase 2: Product Definition (AI Interface)
- [ ] Define MVP feature set (what ships first)
- [ ] Define strict truth/safety guardrails for AI responses
- [ ] Decide content architecture: public vs private AI context
- **Status:** in_progress

### Phase 3: Next.js App Scaffold
- [ ] Create Next.js app under `next_version/` (TypeScript, App Router)
- [ ] Implement core pages/sections: Home, Experience, Case Studies, Credentials
- [ ] Add “AI Context” expanders on experience items (server-provided only)
- **Status:** pending

### Phase 4: Design System (Subtle Material 3)
- [ ] Implement tokens + components (cards, chips, buttons, elevation, state layers)
- [ ] Use palette C1 as default (dark-first)
- [ ] Ensure UI reads “premium” and skimmable
- **Status:** pending

### Phase 5: AI Features (MVP → v1)
- [ ] “Ask AI About Me” chat drawer (server route → model)
- [ ] JD Analyzer (“Honest Fit Assessment”) with structured output
- [ ] Guardrails: anti-sycophancy prompt, explicit “not a fit” allowed
- **Status:** pending

### Phase 6: Admin / Content Editing (v1.1)
- [ ] Decide whether to use Supabase (DB + auth) or file-based content
- [ ] Add an admin-only content surface (optional for MVP)
- **Status:** pending

### Phase 7: Basic Static Fallback (GitHub Pages)
- [ ] Create a single-page HTML/CSS version (no JS-heavy app features)
- [ ] Ensure copy stays aligned with the Next.js “truth set”
- [ ] Decide where this lives (root `index.html` vs `/basic/`)
- **Status:** pending

## Decisions Made
| Decision | Rationale |
|----------|-----------|
| Build React/Next.js AI interface | Aligns with `next_version/WHY_REACT.md` direction; richer interaction than static. |
| Don’t use Lovable | Build ourselves to control quality, truthfulness, and maintainability. |
| LinkedIn de-emphasized | Keep as contact method in footer/contact, not primary CTA. |
| Dark-first palette (C1) | Matches your preference and `next_version/color_test.html`. |
| No radar chart | Hiring manager feedback: confusing and not useful. |
| Portfolio split: Products vs Case Studies | Supports skimming and correct emphasis ordering. |

## Errors Encountered
| Error | Resolution |
|-------|------------|
| `frontend/content_strategy.md` missing | Re-derive strategy from inventory docs + current pages. |
