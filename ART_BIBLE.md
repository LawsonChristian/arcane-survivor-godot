# Arcane Survivor — Art Bible

Stage B.2 · 2026-10-28 · Specification only; no production or runtime changes.

## Authority and evidence

**Established** means a current owner requirement or a measured technical reference. **Proposed** means a recommended future standard, not approved final artwork. Successful B.1 rendering does not make every imported PNG final. Individual production approval is required under [ART_PRODUCTION_PLAN.md](ART_PRODUCTION_PLAN.md).

Evidence: Godot source baseline `d3f2aa7186ae1f6c899cab969d8121581b790117`, especially `scripts/game/character_visual.gd`, `camera_rig.gd`, `world.gd`, `project.godot`, `scripts/prepare_assets.py`, and original PNGs. Browser evidence: `dist/index.html`, `dist/character/`, `dist/enemies/`, environment/reference PNGs in the original browser repository. Exact files/dimensions are in [ASSET_INVENTORY.md](ASSET_INVENTORY.md). Earlier `PROJECT_STATUS.md`, `COMBAT_DESIGN.md`, `ENGINE_EVALUATION.md` are historical browser-repository documents, not files added or rewritten here.

The owner has now confirmed all six B.1 iPhone checks: smooth touch, immediate release stop, correct Mage proportions/walk, correct forest rendering, working collision/sliding, and correct camera/zoom. That is device evidence for this reference appearance, not a final-art or all-devices certification.

## Overall art direction — established

Colorful, charming, nostalgic chibi fantasy with large expressive faces, compact bodies, clear silhouettes and readable hands/feet. Preserve the appealing shape language and colorful fantasy mood in `reference/approved-chibi-direction.png` and B.1. Do not imitate another game's specific characters or introduce a generic generated-art style. New pieces must look like they belong together in gameplay, not merely look attractive as isolated portraits.

Characters should stand out from foliage and stone through silhouette, value separation and controlled accents. Enemies need readable body shapes and faces; environments provide texture without competing with faces and effects. Do not rely on hue alone to distinguish threat/effect states. Weapons float beside the avatar. No back-facing sprites; diagonal/three-quarter sets require separate approval.

## Verified technical baseline

These are compatibility facts, not approval to freeze the source raster resolution forever.

| Property | Verified value / interpretation |
| --- | --- |
| Character space | 128×128 **conceptual** drawing space; existing PNGs are not 128×128 |
| Feet/world root | Character-space point (64,113) maps to player root before pose motion; implementation translates (-64,-113) |
| Gameplay character scale | 0.68; nominal 128-unit canvas spans 87.04 world units, not visible artwork bounds |
| Camera scale | 0.80; nominal combined scale 0.544 before viewport stretching |
| Viewport | 480×800 reference, `canvas_items`, aspect `expand`; 65 logical units reserved for HUD |
| Walk timing | `int(elapsed*7)%4`, four horizontal outfit frames; idle frame index 1 (zero based) |
| Sheet size/cells | 2172×724; four 543×724 cells; only a cropped area is drawn |
| B.1 source crop | Each violet frame: (frame×543,133,543,514) → character-space (37,67,54,46) |
| Green browser crop | y=129, height=518; same target rectangle; this exception is not a new general standard |
| Layer filtering | Character and world explicitly use nearest filtering; no skeletal deformation |
| Collision footprint | Four corners ±10 world units at player root; art size is independent of collision |
| Map | 1760×2560; 22×32 cells of 80; 322 open cells; texture generation is not a reusable tile atlas |

### Current alignment reference

All rectangles below are destination character-space `(x,y,width,height)`, not PNG crop measurements. Preserve them for reference comparisons; future assets should use a coherent common frame rather than requiring these arbitrary per-file stretches.

| Layer | Current reference |
| --- | --- |
| Back hair | (32,16,64,84) |
| Body and eyes | (42,32,44,72) |
| Clothing/legs/hands sheet | (37,67,54,46), source crop above |
| Long front hair | (31,12,66,82), additional gait X offset |
| Browser short/tousled front hair | (31,12,66,62); tousled source crop (57,14,1214,1184) |
| Browser optional hat | (21,-3,86,57); not present in B.1 |
| Staff rectangle | (82,43,24,54), under independent weapon transform |
| Staff rotation pivot | (88,78) in its local drawing space, plus 9-unit X hover offset; B.1 composes translation (97,78+hover) before rotation |

The hat can extend above the nominal 128-unit frame. Source padding is not a reliable head boundary. No standardized head/neck/eye attachment metadata exists yet. Browser `weaponTip()` uses reference (94,50) for Staff, but B.1 has no attack emitter; this is not an approved muzzle for all weapons/spells.

## Technical production standards — proposed

- Retain the 128-unit logical registration and (64,113) reference feet while approving the first final body. Choose physical authoring resolution through the approval question below. Never silently relabel current high-resolution images as native 128-pixel sprites.
- Use lossless RGBA PNG exports for isolated pieces, transparent outside the artwork. Preserve original files separately. No baked scenery, preview background, colored matte or unrelated skin pixels in a component. Check semi-transparent borders against dark, light and map backgrounds; allow deliberate effect alpha but avoid accidental halos.
- Preserve full-frame canvas size, foot registration, frame count and order on export. Disable automatic per-frame trimming unless metadata records the untrimmed offset. A future atlas needs padding/extrusion and source rectangles; it must not move component anchors.
- Export each component's walk parts in the same four-slot horizontal sequence. Static layers may reference a single frame across all four poses. Color variants share dimensions and registration exactly. Never generate a whole animated character for each cosmetic combination.
- Proposed naming for future assets: `char_<component>_<style_id>_<part>_<state>_front_vNN.png`, with metadata for palette ID, source rectangle, logical size, root and supported frame mapping. Example names are conventions, not newly existing assets. Keep current names unchanged.
- Keep editable layered source, export PNG and metadata/provenance together in future production packages. Record approvals and checksums; derive imports/atlases reproducibly. Do not destructively modify `assets/original/`.
- Use nearest texture filtering and lossless import for character/UI art, no unintended resizing or mipmaps. The inspected local body import has `compress/mode=0`, `mipmaps/generate=false`, `process/size_limit=0`, `process/premult_alpha=false`, `process/fix_alpha_border=true`; generated import metadata is not a universal checked-in policy. Verify actual settings before future production import.

### Pixel-perfect considerations

Nearest filtering does not guarantee pixel-perfect output. Current fractional .68/.8 scales, small rotations and subpixel positions can cause uneven pixel sizes. The sources already have differing densities and semi-transparent edges. Preserve the owner-tested feel now; do not change zoom, snap transforms or resample assets during B.2. Proposed future review: compare each candidate at native export resolution, enlarged nearest preview, and actual phone gameplay scale. A strict integer pixel grid would need an explicit scaling decision and measured comparison; do not promise it with the present renderer.

## Visual consistency by family

| Family | Standard / review focus |
| --- | --- |
| Characters | Shared anatomy, silhouette and foot baseline across body presentations. Preserve expressive face-to-body relationship; do not invent a measured head ratio from concept art. |
| Hair | Readable clusters, clean face opening, back/front parts as needed, preserved highlights/outline across palette choices. Hair/hat contact must remain attached through all poses. |
| Eyes | Shape and iris color independent. Eye layer must not carry cheeks, nose, brows or opaque skin unless intentionally designated a face part. Maintain paired eye alignment and support approved blinking later. |
| Outfits | One standardized Mage design, violet/blue/green reference variants. Sleeve ends meet hands, neck meets body; cape must not appear to grow hands. No anatomy/proportion changes per variant. |
| Weapons | Staff, Wand, Codex silhouettes distinct at gameplay size. Default Staff simple wood; elaborate purple/gold original retained for future cosmetic review. No weapon baked into body frames. |
| Enemies | Preserve cute slime direction: green, red and purple/cloud/lightning. Keep faces readable and threat differences recognizable without only color. Current browser draw sizes 37/41/46 are prototype references, not a new balance decision. No enemies currently in Godot B.1. |
| Environment | Forest greens, mossy stone and colorful small accents; preserve B.1 map readability. Existing large raster textures are not 80×80 authored tiles. Future tiles must match the reference density and avoid hard seams; no tile redesign authorized. |
| Spell effects | Readable origin, trajectory/area and elemental identity without hiding avatar/enemy silhouettes. Use restrained brightness and consistent pixel clusters. Burn/Freeze/Shock visuals must follow COMBAT_DESIGN, not invent mechanics. No spell art production now. |
| UI icons | Simple silhouettes, consistent contrast/edge treatment at actual icon size. Distinguish category/status without color alone. No icon atlas, canonical icon sizes or final UI palette currently exist. Approve these with later UI work. |

Lighting, outline thickness and exact palette ramps should be sampled/approved with final body production; no universal numeric palette or pixel thickness has been established. Existing palettes are evidence, not authorization for unreviewed new colors.

## Conflicts and historical discrepancies

- Earlier desire for a skeleton/mesh versus actual and currently approved raster-frame approach: there is no rig; this specification requires shared registration and timing, not different skeletons. No skeletal animation is introduced.
- Earlier hairstyle-exclusive colors versus later independent hair-color selection: current requirement is independent style/color, with any special combinations separately approved later.
- Browser Staff/Sword/Bow versus approved Mage Staff/Wand/Codex: retain the old browser unchanged; do not treat Sword/Bow as Mage categories in new specifications.
- `reference/README.txt` calls the visuals code layers; present code uses PNG layers and a real outfit sheet. It is a historical note, not an instruction to redraw.
- B.1 status says phone tests pending; the owner's B.2 message supersedes that testing status. No historical report is rewritten.
- Current body includes eyes and underwear; current eye overlay includes a skin-colored face strip; current outfit includes hands/legs. These do not satisfy final independent body/eyes/clothes requirements yet.
- Hat attachment and purple sleeve/hand ambiguity were raised earlier. The B.1 pass does not approve every hat, hairstyle or outfit combination.

See **Questions Requiring Owner Approval** in [CHARACTER_SYSTEM.md](CHARACTER_SYSTEM.md). B.2 defines standards and proposals only; B.3/art production requires explicit approval.
