# Task Plan: AI-Powered Portfolio (Vite + React + Supabase) — Spec-Literal (+ Theme Switching)

## Goal
Implement the “AI-powered portfolio with honest fit assessment” spec **literally** using:
- Vite + React (SPA) frontend
- Supabase Postgres + RLS + Edge Functions backend
- No Lovable, no Next.js

Spec map: `next_version/spec_map.md:1`

## Project Root (important)
The codebase root for the React app is:
- `next_version/jh-resume/`

Planning + reference docs remain in:
- `next_version/` (this folder)

## Current Phase
Phase 3

## Phases

### Phase 1: Requirements & Discovery
- [x] Choose direction: **A3 (React/Next.js)**, no Lovable
- [x] Capture initial audits (copy/hierarchy) in `next_version/`
- [x] Record initial palette direction: **C1**
- **Status:** complete

### Phase 2: Product Definition (AI Interface)
- [ ] Translate spec into an explicit MVP checklist (no invention beyond spec)
- [ ] Define strict truth/safety guardrails for AI responses (must allow “probably not”)
- [ ] Decide content architecture: public vs private AI context (admin panel fields)
- **Status:** in_progress (active, but blocked on Phase 3 scaffold)

### Phase 3: Frontend Scaffold (React)
- [x] Decide framework: **Vite + React SPA** (spec uses VITE env vars; no Next.js)
- [x] Create Vite app under `next_version/jh-resume/` (TypeScript)
- [x] Finish Tailwind v4 integration (Vite plugin + CSS entrypoint)
- [x] Match spec component/folder structure as closely as possible (`src/components/...`, `src/pages/...`) per `next_version/spec_map.md:1`
- [x] Add routing skeleton for:
  - Public: `/`
  - Admin: `/admin`, `/admin/profile`, `/admin/experience`, `/admin/skills`, `/admin/settings`
- [x] Implement public page sections (initial skeletons): Hero, Experience, Skills Matrix, Fit Check, Footer
- [x] Implement admin pages (initial skeletons + forms): Profile/Experience/Skills/Gaps/FAQ/Settings
- **Status:** in_progress

### Phase 4: Design System (Subtle Material 3)
- [ ] Follow spec design literally (Playfair + Inter, #0a0a0a bg, #4ade80 accent, #d4a574 amber)
- [ ] Implement cards / buttons / “glass” surfaces as spec describes
- [ ] Ensure skimmability + accessibility (keyboard, focus, reduced motion)
- [ ] Add theme switching from day 1 (default = spec colors; alternates = `next_version/color_test.html`)
- **Status:** pending

### Phase 5: AI Features (MVP → v1)
- [ ] Implement Supabase Edge Function `/chat` per spec (Deno + Anthropic + buildSystemPrompt)
- [ ] Implement Supabase Edge Function `/analyze-jd` per spec (JSON output format)
- [ ] Wire frontend hooks (`useChat`, `useJDAnalyzer`) to those edge functions
- **Status:** pending

### Phase 6: Admin / Content Editing (v1.1)
- [ ] Implement Supabase auth for admin (“single candidate” model)
- [ ] Implement DB migrations + RLS policies + admin forms
- **Status:** pending

## Decisions Made
| Decision | Rationale |
|----------|-----------|
| Build React AI interface | Aligns with `next_version/WHY_REACT.md` direction; richer interaction than static. |
| Don’t use Lovable | Build ourselves to control quality, truthfulness, and maintainability. |
| LinkedIn de-emphasized | Keep as contact method in footer/contact, not primary CTA. |
| Dark-first palette (C1) | Matches your preference and `next_version/color_test.html`. |
| No radar chart | Hiring manager feedback: confusing and not useful. |
| Portfolio split: Products vs Case Studies | Supports skimming and correct emphasis ordering. |
| App root is `next_version/jh-resume/` | Keeps the application separate from planning/reference docs. |
| Theme switching supported from day 1 | Lets you compare spec colors vs alternates quickly without refactors. |

## Errors Encountered
| Error | Resolution |
|-------|------------|
| `npx tailwindcss init -p` failed (Tailwind v4 toolchain) | Use `@tailwindcss/vite` + CSS `@import "tailwindcss";` approach instead. |
