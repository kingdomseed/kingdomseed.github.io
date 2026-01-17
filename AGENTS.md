# AGENTS.md

## Scope
Applies to this repository unless overridden by a deeper `AGENTS.md`.

## How to work here
- Ask 1–3 targeted questions when requirements are unclear.
- Propose a short plan before non-trivial changes.
- Do exactly what was asked; avoid extra features or refactors.
- Never invent facts, results, file contents, or tool outputs.
- Always ask: **How does this fit into the current architecture?**
  - Prefer current implementation/design/intent over other docs when they disagree.
  - If it’s new, extend existing patterns (DRY/SOLID/KISS).
  - If it improves something existing, evolve it incrementally (bit by bit).

## Quality gates (after changes)
- Don’t introduce new errors/warnings in files you touch.
- Run the usual checks for the subproject you changed (lint/build/tests when present).

## Spec/copy discipline
- Don’t change user-facing copy unless explicitly asked.
- If asked for copy help, suggest options first (human may write final copy).
- If copy changes are made, update the corresponding spec docs in the same change.

## External imports (avoid drift/duplication)
- Treat external repos as references: port foundations (tokens/primitives/patterns), not entire pages.
- Don’t land half-integrated files. Either integrate fully (wired/routed/styled/verified) or don’t add it yet.
- Avoid duplicating existing functionality; refactor toward a single shared foundation.

## Repo layout (high level)
- `next_version/jh-resume/`: main app implementation (React/Vite/TS + Supabase + Azure OpenAI).
- `next_version/`: specs and guides for the app.
- `docs/`: case studies and long-form notes.
- `frontend/`, `flutter/`: alternate/prototype variants (edit only when asked; keep changes scoped).

