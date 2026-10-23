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


## Coding principles

- Validate unknown values once at the boundary that owns them. Pass typed values inward instead of repeating `typeof value === "object"` and property-existence checks. Do not defensively revalidate values already guaranteed by a schema, constructor, or internal type.
- Do not extract single-use helpers preemptively. Inline the logic at the call site unless the helper is reused, hides a genuinely complex boundary, or has a clear independent name that improves the caller.
- Before adding complexity for a speculative or vanishingly unlikely race or security edge case, explain the concrete failure mode, likelihood, and complexity cost to the user and get their buy-in. Do not silently expand scope for theoretical robustness.
- Test actual implementation, do not duplicate logic into tests
- Add comments for non-obvious constraints and surprising behavior, not for obvious assignments or control flow.
