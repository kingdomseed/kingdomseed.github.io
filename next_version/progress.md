# Progress Log

## Session: 2026-01-16

### Current Status
- **Phase:** 3 - Frontend Scaffold (React)
- **Started:** 2026-01-16

### Actions Taken
- Initialized `next_version/` planning files (`task_plan.md`, `findings.md`, `progress.md`).
- Reviewed current homepage hero + examined repo variants (`flutter/index.html`, `frontend/index.html`).
- Captured initial findings and constraints in `next_version/findings.md`.
- Drafted planning artifacts for next iteration:
  - `next_version/truth_set.md`
  - `next_version/content_inventory.md`
  - `next_version/hierarchy_audit.md`
  - `next_version/questions_and_decisions.md`
- Drafted initial copy blocks in `next_version/copy_deck.md`.
- Wrote decision brief in `next_version/tech_options.md`.
- Wrote detailed copy review in `next_version/copy_audit_detailed.md`.
- Proposed homepage IA in `next_version/story_structure.md`.
- Proposed palette directions in `next_version/color_directions.md`.
- Pivoted direction to A3 (React/Next.js) per user; updated `next_version/task_plan.md` and truth/copy docs accordingly.
- Locked the framework choice to **Vite + React + Supabase edge functions** (no Next.js) and created a spec navigation map in `next_version/spec_map.md`.
- Updated plan to place the app root at `next_version/jh-resume/` and to require theme switching (default spec palette + C1/C2/C3 toggles).
- Scaffolded the Vite + React + TypeScript app at `next_version/jh-resume/`.
- Installed initial dependencies: React Query, Zustand, React Router, Supabase JS.
- Began Tailwind v4 setup:
  - Added `@tailwindcss/vite` plugin in `next_version/jh-resume/vite.config.ts`.
  - Noted that `npx tailwindcss init -p` does not work the same way in Tailwind v4.
- Implemented theme switching (spec palette + C1/C2/C3) via CSS tokens and `data-theme` on `html`.
- Restructured the app to match the spec’s folder layout (`components/layout|sections|chat|admin`, `hooks`, `lib`, `pages`).
- Added basic router skeleton for public + admin routes and a stub Chat Drawer.
- Verified builds and lints pass.
- Supabase setup:
  - Confirmed Supabase CLI installed.
  - Initialized Supabase project in the new app repo and linked it to the hosted project.
  - Added a migration that matches the spec’s database schema (RLS enabled; policies pending).
- Azure setup:
  - Locked LLM provider to Azure OpenAI.
  - Added Edge Function stubs in the app repo for `/chat` and `/analyze-jd` calling Azure OpenAI `/openai/responses`.

### Test Results
| Test | Expected | Actual | Status |
|------|----------|--------|--------|
| `npm run build` (Vite app) | Successful build | Successful build | ✅ |
| `npm run lint` (ESLint) | No errors | No errors | ✅ |

### Errors
| Error | Resolution |
|-------|------------|
| `frontend/content_strategy.md` not found | Removed from dependency set; treat as unavailable. |
