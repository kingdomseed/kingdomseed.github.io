# Progress Log

## Session: 2026-01-16

### Current Status
- **Phase:** 5 - AI Features (end-to-end working)
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
  - Added and pushed a migration that matches the spec’s database schema (RLS enabled; policies pending).
- Azure setup:
  - Locked LLM provider to Azure OpenAI.
  - Deployed Edge Functions in the Supabase project: `chat`, `analyze-jd` (Azure OpenAI `/openai/responses`).
- Wired the Vite frontend chat + JD analyzer UI to call the deployed Supabase Edge Functions (via `supabase.functions.invoke`).
- Switched client auth to spec-literal env vars: `VITE_SUPABASE_URL` + `VITE_SUPABASE_ANON_KEY` (removed publishable-key pathway).
- Implemented React Query DB reads via `useCandidateData` (profile/experience/skills) and wired Experience + Skills sections to live data.
- Implemented Zustand chat state (drawer open/input/messages/session) and connected it to `useChat`.
- Fixed Azure OpenAI Responses API payload shape (`messages` → `input` + `instructions`) and added a fallback when `reasoning.effort=low` is unsupported.
- Added RLS public-read policies + minimal seed data (single candidate row + one experience + initial skills) via migration, and pushed to remote.

### Test Results
| Test | Expected | Actual | Status |
|------|----------|--------|--------|
| `npm run build` (Vite app) | Successful build | Successful build | ✅ |
| `npm run lint` (ESLint) | No errors | No errors | ✅ |
| Supabase `/chat` edge function | 200 + assistant reply | 200 + assistant reply | ✅ |
| Supabase `/analyze-jd` edge function | 200 + JSON assessment | 200 + JSON assessment | ✅ |

### Errors
| Error | Resolution |
|-------|------------|
| `frontend/content_strategy.md` not found | Removed from dependency set; treat as unavailable. |
