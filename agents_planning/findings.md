# Findings: Transferable Working Principles (Draft Workspace)

This file is a scratchpad for extracted principles and notes. The “publishable” version will live at `docs/agents/transferable_principles_from_mythicgme2e.md`.

## Sources Reviewed (initial)
- MythicGME2e:
  - `/Users/jholt/development/mythicgme2e/AGENTS.md`
  - `/Users/jholt/development/mythicgme2e/patch_agents.txt`
  - `/Users/jholt/development/mythicgme2e/.claude/agents/*` (listed; not read yet)
- jh-resume:
  - `next_version/jh-resume/AGENTS.md`
  - `next_version/Advanced Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md` (not read fully yet)
  - `next_version/Beginners Guide_ How to Build an AI-Powered Portfolio Site with Lovable.md` (not read fully yet)
  - `next_version/WHY_REACT.md` (not read fully yet)

## Early Transferable Buckets (to fill)

### A) Workflow / Human-in-the-Loop
- MythicGME2e: “Plan Before Code”; “Human-in-the-Loop”; “Git hygiene when parallel agents exist”.
- Transfer: Applies directly to any repo; translate Flutter-specific “analyze first” into “lint/typecheck/tests first” per project.
- MythicGME2e `.claude/agents/*`: repeats a consistent **RESEARCH → PLAN → IMPLEMENT → VERIFY** workflow and checklists for “done”.

### B) Quality Gates / “Zero Tolerance”
- MythicGME2e: no analyzer/custom_lint issues.
- Transfer: enforce “no lint/typecheck errors” and “no CI regressions” before considering work done.
- Transfer nuance: apply as “no new errors/warnings in touched files” if legacy repos have pre-existing debt (explicitly call out exceptions).

### C) No New Tech Debt
- MythicGME2e: forbids shims/workarounds; remove bridging code in same PR.
- Transfer: same principle; translate into “no temporary hacks”; prefer fixing root causes.

### D) Strong Typing / Explicit APIs
- MythicGME2e: avoid `dynamic`; prefer explicit types and exhaustive switches.
- Transfer: applies strongly to TS/React subproject; prefer strict TS, discriminated unions, exhaustive checks.

### E) Error Handling Discipline
- MythicGME2e: avoid catching `Object`; avoid generic `Exception`; wrap in domain exception types.
- Transfer: applies conceptually; translate to “catch narrow errors”, avoid swallowing errors, and standardize error boundaries.

### F) Lifecycle & Timing (No “Timing Fixes”)
- MythicGME2e: bans `addPostFrameCallback`, `Future.microtask` timing workarounds (with rare exceptions).
- Transfer: translate to “avoid setTimeout/Promise microtask hacks for ordering”; fix dataflow/ownership.

### G) Architecture Boundaries
- MythicGME2e: feature-first layering (Presentation/Application/Domain/Data).
- Transfer: can be mapped to “feature-first” folders and one-way dependency rules (e.g., UI → domain → data).

### H) Security & Secrets
- MythicGME2e: emphasizes tight discipline (not fully extracted yet).
- Transfer: ensure repo-level guidance: secrets in env files; no committed keys; document safe patterns.

## Notes from `next_version` Lovable guides (to extract)
Likely transferrable themes (based on quick grep):
- Anti-sycophancy, calibrated honesty, permission to reject (“not a fit”).
- Structured system prompt building, separating “facts” from “instructions”.
- Keeping “instructions” data-driven and editable (tables like `ai_instructions`).

Additional concrete takeaways (from sampled sections):
- **Explicit anti-sycophancy instructions** belong in the “highest precedence” instruction surface (system prompt / agent instructions), not only implied by tone.
- **Forcing commitment**: structured outputs (e.g., JSON verdicts) reduce hedging; analog for coding: require explicit “assumptions / risks / next steps”.
- **Separate public vs private context**: useful pattern for docs and prompts (what can be published vs what is internal/ops-only).
- **Test “bad fit” cases**: if you want an agent to refuse/avoid scope creep, add tests/examples that should be rejected (e.g., “don’t touch node_modules”, “don’t add features”).

## Notes from `next_version/WHY_REACT.md` (transferable)
- Premise: ATS/LinkedIn optimization is a losing arms race; build your own “interface layer”.
- For agent instructions: prioritize “demonstrate capability” over credentialing language; resist marketing fluff.
- Reinforces the **anti-sycophancy** requirement: forbid “I can probably do X” when evidence is missing.
- Encourages “deep context” capture: more useful than polished bullets, because it survives interrogation.

## Notes from MythicGME2e `.claude/agents/*` (transferable)
- Prefer **structured, explicit prompts** when delegating to another agent/model: architecture requirements + types + acceptance checklist.
- Use **checklists** for “validation” (interface compliance, imports, error handling, etc.).
- Pattern: “inventory/audit first, then refactor” to avoid breaking performance or constraints (maps well to React: audit components before extracting design-system primitives).
- Accessibility guidance is present and can transfer conceptually (prefer native semantics/ARIA-first; avoid redundant wrappers).

## Open Questions
- Do you want the root `AGENTS.md` to include “agent behavior” (anti-sycophancy, question-asking), or only “repo navigation + coding rules”? Yes
