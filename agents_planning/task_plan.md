# Task Plan: AGENTS Harmonization (jh-resume)

## Goal
Add a clear, layered `AGENTS.md` hierarchy across meaningful architecture boundaries in this repo, and publish a single concise “AI working principles” doc that the AGENTS can align to.

## Non-goals
- No functional product work (no new features, no refactors) unless explicitly requested later.
- No “every folder” changes to generated/vendor dirs (e.g., `node_modules/`, `dist/`, `.git/`) unless explicitly requested.
- Do not add provenance/attribution noise (“where rules came from”) inside `AGENTS.md`.

## Deliverables
- `docs/agents/ai_working_principles.md` (the actual principles, phrased as “do this / don’t do this”; no origin story).
- `AGENTS.md` files at meaningful architecture boundaries (tree and exact contents below).

## Current Phase
Phase 0 — Draft the AGENTS tree + exact contents

## Phases

### Phase 0 — Scope & Definitions
- [x] Confirm scope = meaningful architecture boundaries (not literally every directory)
- [x] Confirm include agent behavior (anti-sycophancy, truthfulness, question-asking)
- [x] Confirm unify style across files
- [ ] Draft the **AGENTS tree** (files + scope) for review
- [ ] Draft the **exact contents** of each `AGENTS.md` for review
- **Status:** in_progress

### Phase 1 — Source Inventory & Extraction
- [ ] Extract the *minimal* set of principles we want to preserve across projects in this repo
- [ ] Normalize into short “do/don’t” rules with examples only where truly needed
- **Status:** pending

### Phase 2 — AGENTS Hierarchy Design (Proposed)
- [ ] Ensure each file only contains what future agents need (no background/provenance)
- [ ] Keep deeper `AGENTS.md` short and additive; avoid duplication
- **Status:** pending

### Phase 3 — Inventory Doc (Transferable Learnings)
- [ ] Write `docs/agents/ai_working_principles.md` as a clean list of rules (no “source” sections)
- **Status:** pending

### Phase 4 — Implementation Rollout
- [ ] Create/update all planned `AGENTS.md` files
- [ ] Confirm scopes make sense and don’t create drift/duplication
- **Status:** pending

### Phase 5 — Review & Tighten
- [ ] Quick consistency pass: no contradictions, no duplicated rules, commands correct
- [ ] Confirm “human-in-the-loop” + “side effects confirmation” are represented
- [ ] Summarize changes + open questions
- **Status:** pending

## Decisions Confirmed (2026-01-17)
- “Every folder” = **every meaningful architecture boundary**, not literal every directory.
- Include **agent behavior** (anti-sycophancy, truthfulness, question-asking).
- Unify style across `AGENTS.md` files.
- Do not add “where rules came from” content inside `AGENTS.md`.

---

## A) Internal instructions for Codex (NOT to be copied into AGENTS)
These are constraints on *how I will write* the repo’s `AGENTS.md` files:
- Keep each `AGENTS.md` short; no parentheticals like “(transferable)” or “(from X)”.
- Do not include “source of truth” or “where rules came from” sections.
- Prefer imperatives: “Do X”, “Don’t do Y”, “If unsure, ask Z”.
- Avoid duplicating the same rule in many files; put cross-cutting behavior in the closest common ancestor.

---

## B) Planned AGENTS Tree (meaningful boundaries)
Proposed file set (you’ll approve via the drafts below):
1. `AGENTS.md` (repo root)
2. `docs/AGENTS.md`
3. `next_version/AGENTS.md`
4. `next_version/jh-resume/AGENTS.md` (update existing)
5. `next_version/jh-resume/src/AGENTS.md`
6. `next_version/jh-resume/supabase/AGENTS.md`
7. `frontend/AGENTS.md`
8. `flutter/AGENTS.md`

Notes:
- No `AGENTS.md` in: `.git/`, `node_modules/`, `dist/`, build outputs/caches.
- We will not touch `next_version/jh-resume/.agent/skills/.../AGENTS.md` (skill-owned content).

---

## C) Exact `AGENTS.md` Contents (for review)

### 1) `AGENTS.md` (repo root) — exact draft
```md
# AGENTS.md

## Scope
Applies to this repository unless overridden by a deeper `AGENTS.md`.

## How to work here
- Ask 1–3 targeted questions when requirements are unclear.
- Propose a short plan before making non-trivial changes.
- Do exactly what was asked; avoid extra features or refactors.
- Don’t make up facts, results, or file contents. If you can’t verify it from repo context, say so.
- Before external side effects (deploys, API calls, writing tickets/docs elsewhere), ask for explicit confirmation.

## Quality bar
- Don’t introduce new errors/warnings in files you touch.
- Prefer running the smallest relevant checks for the subproject you changed.

## Repo layout (high level)
- `next_version/jh-resume/`: main app implementation (React/Vite/TS + Supabase).
- `next_version/`: specs and guides that inform the app.
- `docs/`: case studies and long-form notes.
- `frontend/`, `flutter/`: alternate/prototype variants (edit only when asked; keep changes scoped).
```

### 2) `docs/AGENTS.md` — exact draft
```md
# AGENTS.md

## Scope
Applies to `docs/` and its subfolders.

## How to work in docs
- Write only what is true and supportable from repo context.
- Use concrete dates and definitions when describing metrics or timelines.
- If something is uncertain or private, either omit it or label it clearly as an assumption.
- Keep edits surgical: update the specific doc sections that changed; don’t rewrite everything.
```

### 3) `next_version/AGENTS.md` — exact draft
```md
# AGENTS.md

## Scope
Applies to `next_version/` except where overridden by deeper `AGENTS.md`.

## How to work in this folder
- Treat docs here as instructions/specs for the app; don’t invent behaviors not described in the docs.
- Keep changes minimal and intentional; update references if you rename/move files.
- Preserve the project’s “honest fit assessment” behavior: direct, non-sycophantic, willing to say “not a fit”.
```

### 4) `next_version/jh-resume/AGENTS.md` (update existing) — exact draft replacement
```md
# AGENTS.md

## Scope
Applies to `next_version/jh-resume/` except where overridden by deeper `AGENTS.md`.

## How to work in this app
- Keep changes scoped to the request; don’t add extra features.
- Be direct and non-sycophantic in copy and AI behaviors (avoid hedging and overselling).
- Don’t commit secrets. Use `.env.local` for local dev and Supabase secrets for server-side keys.

## Project structure
- App code: `src/` (entry: `src/main.tsx`, root component: `src/App.tsx`).
- Routing: `react-router-dom` routes defined in `src/App.tsx`.
- Pages: `src/pages/`.
- Components: `src/components/` (`layout/`, `sections/`, `chat/`, `admin/`).
- Hooks/state/data: `src/hooks/`, `src/lib/`.
- Styles: `src/styles/`.
- Supabase: `supabase/` (migrations + edge functions).

## Commands
Use `npm`:
- `npm run dev`
- `npm run build`
- `npm run lint`

## Coding conventions
- TypeScript is strict; avoid `any` except at hard boundaries.
- Keep imports direct; avoid barrel re-exports in hot paths.
```

### 5) `next_version/jh-resume/src/AGENTS.md` — exact draft
```md
# AGENTS.md

## Scope
Applies to `next_version/jh-resume/src/`.

## Rules
- Follow existing patterns in `src/` (don’t reorganize folders unless asked).
- Keep UI changes accessible and keyboard-friendly.
- Prefer small components with clear props; avoid hidden global side effects.
```

### 6) `next_version/jh-resume/supabase/AGENTS.md` — exact draft
```md
# AGENTS.md

## Scope
Applies to `next_version/jh-resume/supabase/`.

## Rules
- Don’t hardcode secrets into functions. Read secrets from Supabase/Edge Function env.
- Keep migrations additive and reversible where possible.
- When changing edge function request/response shapes, update the frontend callers in the same change.
```

### 7) `frontend/AGENTS.md` — exact draft
```md
# AGENTS.md

## Scope
Applies to `frontend/`.

## Rules
- Treat this as a prototype/variant folder. Don’t make sweeping changes unless asked.
- If you update shared copy/components here, keep it consistent with the main site where applicable.
```

### 8) `flutter/AGENTS.md` — exact draft
```md
# AGENTS.md

## Scope
Applies to `flutter/`.

## Rules
- Treat this as a prototype/variant folder. Don’t make sweeping changes unless asked.
- Keep changes scoped and avoid adding dependencies unless explicitly requested.
```

## Risks
- Over-scoping: placing `AGENTS.md` into generated/vendor directories creates maintenance noise.
- Conflict: duplicating the same rules across many scopes can drift over time.

## Errors Encountered
| Error | Attempt | Resolution |
|-------|---------|------------|
|       | 1       |            |
