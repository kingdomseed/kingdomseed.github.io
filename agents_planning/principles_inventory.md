# Principles Inventory (to port into this repo’s AGENTS)

## Objective
Inventory the *principles we want future agents to follow* in this repo, distilled from:
- MythicGME2e working style (excluding Flutter architecture)
- The `next_version` docs you listed (Advanced Guide, Beginners Guide, WHY_REACT)

This is the raw inventory. Next step is converting this into concise, low-noise `AGENTS.md` content per folder scope.

---

## 1) Human-in-the-loop workflow
- Ask 1–3 targeted questions when requirements are unclear.
- Propose a short plan before non-trivial changes.
- Keep changes scoped to the request; no “nice-to-haves”.
- Treat the human as final authority for tradeoffs and “what done means”.

## 2) Truthfulness + anti-sycophancy (default posture)
- Never oversell capabilities or imply experience you don’t have evidence for in repo context.
- If asked for something we don’t have, say so plainly (no “but I could learn quickly” hedging).
- It is explicitly acceptable to recommend “don’t do this / don’t hire for this / this is not a fit” when appropriate.
- Prefer direct, concrete language over marketing language.

## 3) Evidence, uncertainty, and assumptions
- Don’t invent facts, results, file contents, or tool outputs.
- When something can’t be verified from local context, label it clearly as an assumption and ask for confirmation.
- Use concrete dates and definitions when referencing timelines or metrics (avoid “recently”, “a while ago”).

## 4) Quality gates / definition of done
- Don’t introduce new errors or warnings in the files you touch.
- For code changes: run the smallest relevant checks for the scope you edited (build/typecheck/lint/tests as applicable).
- Prefer targeted verification over repeatedly running large suites hoping to “get lucky”.
- Default expectation after changes: run lint + build/typecheck, and run tests **if** the project has tests configured.

## 5) Scope discipline and tech-debt avoidance
- Avoid “temporary hacks” that are intended to be cleaned up later; if a workaround is unavoidable, contain it tightly and remove it in the same change.
- Avoid “timing hacks” that paper over ordering/lifecycle issues; fix ownership and dataflow instead.
- Always ask: **“How does this fit into the current architecture?”**
  - Prefer the current implementation, design system, and project intent over other docs/spec text when they disagree.
  - If the change is “something new”, add it by extending existing patterns (DRY/SOLID/KISS) rather than introducing a parallel system.
  - If the change improves something existing, evolve it incrementally (bit by bit), not via a big-bang rewrite.

## 6) Spec/copy discipline
- Don’t change user-facing copy unless explicitly asked.
- If asked for copy help, provide suggestions/options first (the human may want to write final copy).
- If copy changes are made, update the spec/source docs that define that copy in the same change (avoid spec drift).

## 7) Design language + theme modularity
- Preserve the modular theme system (fast theme switching for testing).
- Theme modularity is intentional even if some docs/specs don’t reflect it yet; follow the current implementation.
- When adopting a “clean design language” from outside the app, extract it into the existing design system (tokens/themes) instead of copying whole pages wholesale.
- Prefer semantic tokens over hardcoded values: components should consume shared tokens instead of inventing new one-off colors/spacing.
- Avoid leaving drift/duplicates: don’t recreate pages/routes/components if an equivalent already exists; refactor toward the shared foundation.

## 8) Importing from external reference projects
- Treat external repos as references: port **foundations** (tokens, primitives, patterns) rather than cloning entire pages.
- When you port something in, either:
  - integrate it fully (wired, routed, styled, tested), or
  - don’t add it yet (avoid landing “half-migrated” broken pieces).
- If the reference has tests for the thing you’re porting, bring the test intent with it (port or rewrite) so regressions don’t reappear.
- Remove or replace old/duplicate implementations as you integrate, so the app doesn’t accumulate multiple competing versions of the same thing.
- Keep configs/versioning in mind (don’t blindly transplant build tooling or Tailwind configs across major versions).

## 9) Public vs private boundaries (information hygiene)
- Preserve strict separation between:
  - public-facing content (safe to show on the site)
  - private/internal context (notes that exist to make the system honest/useful)
- When writing docs or prompts: explicitly decide what belongs in public vs private buckets.

## 10) Explicit gaps + “bad fit” handling
- Document gaps/weaknesses explicitly (the system can’t be honest about gaps it doesn’t know).
- Test against “bad fit” scenarios and ensure the system actually rejects/flags them (not just good-fit examples).

## 11) Structured outputs reduce hedging
- When the output drives a decision, prefer structured formats that force commitment (e.g., a verdict + reasons) instead of vague paragraphs.
- For agent work: require explicit “assumptions / risks / next steps” when outcomes are ambiguous.

## 12) Security and secrets
- Never commit secrets; use env/secrets mechanisms.
- Keep server-only secrets out of frontend code.
- If a task touches auth/keys/secrets, explicitly call out risks and confirm handling approach.

## 13) Supabase safety (prevent accidental destructive changes)
- Treat migrations and policies as “sharp tools”: avoid destructive changes by default.
- Don’t drop tables, truncate data, or write broad deletes unless explicitly requested and reviewed.
- Prefer additive migrations and narrowly-scoped changes.
- When changing schemas/policies, call out the risk surface (data loss, RLS breakage) and confirm intent.

## 14) LLM provider abstraction
- The app’s architecture remains stable even if the model provider differs.
- Default in this repo: **Azure OpenAI** (chosen for cost).
- Some guides/spec docs may mention Anthropic/OpenAI directly; treat that as an intentional deviation and keep implementation/provider guidance consistent with the actual codebase.
- Avoid provider-specific assumptions in app logic unless explicitly requested (keep the “provider swap” surface area small).

## 15) Documentation editing discipline
- Prefer surgical edits to the relevant sections; avoid rewriting whole docs unless requested.
- Keep references consistent when moving/renaming files.
- Write “why” more than “what” when documenting decisions.

## 16) Keep what already works (existing repo guidelines)
- Preserve project-local conventions that are already helpful and concrete (commands, folder map, performance rules, security notes).
- For the React app: keep the performance posture (avoid waterfalls, keep bundles lean, narrow effect deps, dedupe event listeners).
  - Default checks for `next_version/jh-resume/`: `npm run lint` and `npm run build` (and `npm test` if/when added).

---

## Exclusions (explicitly *not* porting)
- Flutter/Dart architectural patterns (feature-layering, Riverpod specifics, widget/theming specifics).
- Model-routing / “which model to use for which task” guidance (unless you explicitly ask for it).
