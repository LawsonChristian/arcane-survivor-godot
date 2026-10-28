# Stage B.2 — Documentation and specification status

Date: 2026-10-28. Documentation-only baseline: `d3f2aa7186ae1f6c899cab969d8121581b790117` in `LawsonChristian/arcane-survivor-godot`.

## Documents created

1. [ART_BIBLE.md](ART_BIBLE.md): visual identity, measured reference coordinates/crops/scales, proposed production standards, consistency requirements and historical discrepancies.
2. [CHARACTER_SYSTEM.md](CHARACTER_SYSTEM.md): shared body, coverage, components, proposed layering/data/anchor contracts, synchronized animation and Mage equipment. Contains **Questions Requiring Owner Approval**.
3. [ASSET_INVENTORY.md](ASSET_INVENTORY.md): all 42 original browser PNGs with dimensions, usage, frames, classifications and concerns; eight Godot originals, generated world/map data and missing/procedural asset families.
4. [ART_PRODUCTION_PLAN.md](ART_PRODUCTION_PLAN.md): nine ordered component steps, source/dependency requirements, expected output, previews and individual acceptance gates.
5. This report.

Established owner requirements and measured implementation facts are distinguished from recommendations. These documents do not make pending standards or artwork final by implication.

## Inspection evidence

Read the actual B.1 renderer, camera, project settings, texture import example and map-generation script; compared the original browser layer/crop/animation code and reference note. Reviewed PROJECT_STATUS.md, COMBAT_DESIGN.md, ENGINE_EVALUATION.md and B.1 status as historical sources. All 42 original browser PNGs were opened for metadata/decodability. Direct visual inspection included the shared body, eye strip, long/short hair, violet/blue hand-inclusive walk sheets, ornate Staff, witch hat, approved chibi reference, three slime sprites, ground and canopy sources. Other variants were measured/inventoried, not claimed to be individually final-approved or visually certified in every combination. No new images/contact sheets were generated.

The B.1 report's previously pending phone status is superseded by the owner's B.2 message: all six checks passed on their iPhone (touch smoothness/release, Mage proportions/walk, map, collision/sliding, camera/zoom). This is recorded as owner-reported testing, not a new test performed by the assistant. Historical reports and deployment are unchanged.

## Verified technical specifications

| Specification | Evidence / value |
| --- | --- |
| Logical character space | Browser comments and drawMage: 128×128 conceptual units |
| Root | (64,113) reference foot registration; draw offset (-64,-113) |
| Scale | Character .68, camera .8; combined nominal .544 before viewport stretch |
| Viewport | 480×800 reference, canvas_items / expand, 65-unit HUD |
| Walk | Four forward frames at 7 FPS; zero-based frame 1 idle |
| Outfit source | 2172×724, four 543×724 cells; violet/blue crop y133,h514; green y129,h518 in browser |
| Body / eyes | Each 243×398 PNG; body embeds eyes/coverage, eyes overlay contains skin/face pixels |
| Hair and weapon | Differing source sizes and explicit destination rectangles; Staff PNG 190×425; no general attachment metadata |
| Map | 1760×2560, 22×32 cells, 80 units/cell, 322 open cells; ground/canopy sources each 1024×1536 RGB |
| Implementation | Raster layers plus procedural transforms; no skeletal mesh, no final cosmetic catalog |
| Filtering | Explicit nearest filtering; fractional scale/pose transforms mean strict pixel-perfect output is not established |

## Conflicts / gaps flagged

- Historical skeleton/mesh language conflicts with actual raster layers and the current no-skeleton requirement.
- Older hairstyle-exclusive palette idea is superseded by independent style/color selection.
- Browser Sword/Bow choices are not approved Mage Staff/Wand/Codex categories; no legacy options removed.
- Combined body/face/clothes/limbs do not yet meet fully independent modular-production requirements.
- Hat/hair contact and purple hands/cape concerns require component-level review despite the B.1 technical pass.
- Reference README's “code layers,” project.godot's old Stage A comment, audit-era “no Godot” statements and historical pending-device reports describe earlier states. They are not silently edited or treated as current functionality.
- Existing high-resolution source PNGs and fractional display scales do not establish a universal native pixel grid. Exact pixel-density choice remains pending.
- No final wooden Staff, Wand/Codex, multiple eye-shape art, separate neutral shared-body frame set, final icon atlas or full spell-art catalog was found.

## Decisions requiring approval

The four production blockers are detailed with options/defaults in CHARACTER_SYSTEM.md:

1. Final production pixel grid (recommend testing native 128×128 while retaining current logical registration).
2. Shared coverage-layer approach and its visual design.
3. Shared animated limbs/hands versus outfit-owned limbs (recommend shared limbs plus garment masks/overlays).
4. One unisex standard Mage silhouette versus alternate cuts (recommend one silhouette first).

Exact eye shapes, hairstyle choices and weapon designs remain individual production approvals in sequence. None has been produced. No B.3 authorization is inferred from these documents.

## Preservation and verification

Only the five new root Markdown files are authorized for this commit. A pre-edit SHA-256 snapshot of the existing Godot and original browser files was compared after drafting: no pre-existing file changed. No scenes, GDScript, PNGs, generation/build scripts, project/import settings, workflow files or older reports were modified. No build, export, gameplay tests or deployment were run for this documentation-only stage. Such checks would not validate an art specification.

Before updating main, the proposed commit is compared with its exact parent using GitHub's compare operation; it must list exactly the five added Markdown documents. After updating main, the comparison is repeated to verify the committed result. Workflow remains manual-only; a documentation commit does not redeploy the preview. Original browser index SHA-256 remains `81d3ed9233af4d2ed020c7ac69f07e63c13382c5232d0d3fe3c2a42c30e5d5a1`.

No gameplay, artwork or deployment files changed. No new images, customization UI, save system, mechanics or asset production. Stop after Stage B.2 for owner review; do not start B.3 without explicit approval.
