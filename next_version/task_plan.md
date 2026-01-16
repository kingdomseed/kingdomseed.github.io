# Task Plan: Next version story-first Flutter-first site

## Goal
Produce a `next_version/` rebuild plan + working homepage prototype that tells Jason’s story truthfully (Flutter/Dart + CompLing first), is easy to skim, and is easy to maintain and rearrange.

## Current Phase
Phase 1

## Phases

### Phase 1: Requirements & Discovery
- [x] Understand user intent
- [x] Identify constraints
- [x] Document initial findings in `next_version/findings.md`
- **Status:** complete

### Phase 2: Content Audit (Copy + Claims)
- [x] Start inventory table (`next_version/content_inventory.md`)
- [x] Mark key claims as: keep / rewrite / remove + “needs source?” (`next_version/content_inventory.md`, `next_version/copy_audit_detailed.md`)
- [x] Extract “approved truth set” (`next_version/truth_set.md`)
- **Status:** complete

### Phase 3: Story & Information Architecture
- [x] Propose a skimmable story flow (`next_version/story_structure.md`)
- [x] Define primary/secondary emphasis (`next_version/hierarchy_audit.md`)
- [x] Specify what goes on homepage vs case studies vs resume PDF (`next_version/story_structure.md`)
- **Status:** complete

### Phase 4: Design System (Subtle Material 3)
- [ ] Define tokens (color, type scale, spacing, radius, elevation)
- [ ] Pick a distinctive but professional palette (emerald-leaning option included)
- [ ] Decide on layout patterns (hero dominance, grids, cards)
- **Status:** in_progress

### Phase 5: Build `next_version/` Prototype
- [ ] Scaffold HTML sections as movable “blocks”
- [ ] Split CSS into small files (tokens/components/sections/utilities)
- [ ] Ensure hero + case studies + CV download + contact are clear and fast
- **Status:** pending

### Phase 6: Verification & Cutover Plan
- [ ] Validate content accuracy vs the “truth set”
- [ ] Quick accessibility + responsive checks
- [ ] Document a safe cutover from root → `next_version/` (no surprises)
- **Status:** pending

### Phase 7 (Optional): “AI Interface” Layer
> Only if you explicitly want this direction (from `next_version/WHY_REACT.md` / Lovable guides).
- [ ] Decide whether to build: chat drawer, JD fit analyzer, “AI context” expanders
- [ ] Define strict truth/safety guardrails (what the AI can/can’t claim)
- [ ] Choose tech + hosting pattern (static + serverless vs full app)
- **Status:** blocked (needs decision)

## Decisions Made
| Decision | Rationale |
|----------|-----------|
| Work in `next_version/` first | Avoid destabilizing the currently deployed site while iterating. |

## Errors Encountered
| Error | Resolution |
|-------|------------|
| `frontend/content_strategy.md` missing | Re-derive strategy from inventory docs + current pages. |
