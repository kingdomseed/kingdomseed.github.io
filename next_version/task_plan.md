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
- [ ] Mark each claim as: keep / rewrite / remove + “needs source?”
- [ ] Extract “approved truth set” from inventory docs (incl. awards/certs)
- **Status:** in_progress

### Phase 3: Story & Information Architecture
- [ ] Propose a skimmable story flow (sections + order + CTA placement)
- [ ] Define primary/secondary emphasis (Flutter vs web) via hierarchy, not deletion
- [ ] Specify what goes on homepage vs case studies vs resume PDF
- **Status:** pending

### Phase 4: Design System (Subtle Material 3)
- [ ] Define tokens (color, type scale, spacing, radius, elevation)
- [ ] Pick a distinctive but professional palette (emerald-leaning option included)
- [ ] Decide on layout patterns (hero dominance, grids, cards)
- **Status:** pending

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

## Decisions Made
| Decision | Rationale |
|----------|-----------|
| Work in `next_version/` first | Avoid destabilizing the currently deployed site while iterating. |

## Errors Encountered
| Error | Resolution |
|-------|------------|
| `frontend/content_strategy.md` missing | Re-derive strategy from inventory docs + current pages. |
