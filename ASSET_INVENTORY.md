# Arcane Survivor — Asset Inventory

Stage B.2 · measured 2026-10-28. Dimensions are physical PNG pixels, not character-space sizes. All 42 original browser PNGs were opened for metadata/decodability; representative layers, walk sheets, enemy and environment families were visually inspected. No contact sheets or new images were generated.

## Classification rules

- **Approved technical reference:** Successfully used in B.1, not necessarily final artwork.
- **Approved artwork:** Explicitly approved for continued use, only within the stated scope.
- **Temporary:** Development/legacy material expected to be revised or replaced.
- **Needs review:** Final status is undetermined.

The approved chibi concept is approved as a visual reference only, not a production sheet. Cute slime direction and three-tier ideas were approved conversationally; exact current slime PNGs retain Needs review for final production because no final asset contract/revision approval was established. Preserving the ornate staff for cosmetics does not make its final cosmetic status automatic.

## Locations and usage

`Browser:` paths below are in the original JavaScript repository, not inside this Godot repository. `Godot:` paths are relative to this repository. B.1 copies exactly eight originals to `assets/original/`; SHA256.json records their hashes. Original browser art stays in place.

| Browser file | Dimensions / mode | Frames | Purpose and current usage | Classification | Concerns |
| --- | --- | --- | --- | --- | --- |
| `dist/character/body.png` | 243×398 RGBA | 1 | B.1 shared reference; browser body layer | Approved technical reference | Embedded eyes and underwear/coverage; not a neutral independent final body. Same dimensions do not prove identical content. |
| `dist/character/body_amber.png` | 243×398 RGBA | 1 | Retained combined body/color variant; not current selected body layer | Temporary | Embedded eyes and underwear/coverage; not a neutral independent final body. Same dimensions do not prove identical content. |
| `dist/character/body_blue.png` | 243×398 RGBA | 1 | Retained combined body/color variant; not current selected body layer | Temporary | Embedded eyes and underwear/coverage; not a neutral independent final body. Same dimensions do not prove identical content. |
| `dist/character/body_green.png` | 243×398 RGBA | 1 | Retained combined body/color variant; not current selected body layer | Temporary | Embedded eyes and underwear/coverage; not a neutral independent final body. Same dimensions do not prove identical content. |
| `dist/character/body_rose.png` | 243×398 RGBA | 1 | Retained combined body/color variant; not current selected body layer | Temporary | Embedded eyes and underwear/coverage; not a neutral independent final body. Same dimensions do not prove identical content. |
| `dist/character/eyes.png` | 243×398 RGBA | 1 | B.1 violet eye layer; browser eye option | Approved technical reference | Contains skin/face strip, not only irises; opaque coverage may hide body pixels. Five colors, one current shape. |
| `dist/character/eyes_amber.png` | 243×398 RGBA | 1 | Browser eye-color option; no separate shape catalog | Needs review | Contains skin/face strip, not only irises; opaque coverage may hide body pixels. Five colors, one current shape. |
| `dist/character/eyes_blue.png` | 243×398 RGBA | 1 | Browser eye-color option; no separate shape catalog | Needs review | Contains skin/face strip, not only irises; opaque coverage may hide body pixels. Five colors, one current shape. |
| `dist/character/eyes_green.png` | 243×398 RGBA | 1 | Browser eye-color option; no separate shape catalog | Needs review | Contains skin/face strip, not only irises; opaque coverage may hide body pixels. Five colors, one current shape. |
| `dist/character/eyes_rose.png` | 243×398 RGBA | 1 | Browser eye-color option; no separate shape catalog | Needs review | Contains skin/face strip, not only irises; opaque coverage may hide body pixels. Five colors, one current shape. |
| `dist/character/hair-tousled.png` | 1290×1219 RGBA | 1 | Browser style/tint source | Needs review | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_back.png` | 391×516 RGBA | 1 | B.1/back or long hair reference; browser style | Approved technical reference | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_back_blue.png` | 391×516 RGBA | 1 | Retained precolored variant; some preloaded, current renderer uses base image + independent tint | Needs review | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_back_gold.png` | 391×516 RGBA | 1 | Retained precolored variant; some preloaded, current renderer uses base image + independent tint | Needs review | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_back_rose.png` | 391×516 RGBA | 1 | Retained precolored variant; some preloaded, current renderer uses base image + independent tint | Needs review | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_long.png` | 399×496 RGBA | 1 | B.1/back or long hair reference; browser style | Approved technical reference | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_long_blue.png` | 399×496 RGBA | 1 | Retained precolored variant; some preloaded, current renderer uses base image + independent tint | Needs review | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_long_gold.png` | 399×496 RGBA | 1 | Retained precolored variant; some preloaded, current renderer uses base image + independent tint | Needs review | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_long_rose.png` | 399×496 RGBA | 1 | Retained precolored variant; some preloaded, current renderer uses base image + independent tint | Needs review | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_short.png` | 363×343 RGBA | 1 | Browser style/tint source | Needs review | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_short_blue.png` | 363×343 RGBA | 1 | Retained precolored variant; some preloaded, current renderer uses base image + independent tint | Needs review | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_short_gold.png` | 363×343 RGBA | 1 | Retained precolored variant; some preloaded, current renderer uses base image + independent tint | Needs review | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hair_short_rose.png` | 363×343 RGBA | 1 | Retained precolored variant; some preloaded, current renderer uses base image + independent tint | Needs review | Different source dimensions/padding. Long hair has front/back parts; short has no dedicated back part. Tousled requires crop (57,14,1214,1184). Hat compatibility unverified across all styles. |
| `dist/character/hat.png` | 409×281 RGBA | 1 | Optional browser witch hat; not in B.1 | Needs review | Historical floating/gap concern; target rect (21,-3,86,57) extends above logical frame. Requires per-pose contact review. |
| `dist/character/outfit.png` | 321×274 RGBA | 1 | Browser fallback static outfit; not normal current walk rendering | Temporary | Not a complete animation or independent final garment contract. |
| `dist/character/staff.png` | 190×425 RGBA | 1 | B.1 floating ornate Staff; preserve for future cosmetic | Approved technical reference | Not intended default wooden Staff. Separate pivot/hover; future cosmetic approval still required. |
| `dist/character/walk-blue-hands.png` | 2172×724 RGBA | 4 horizontal; cells 543×724 | Browser active color sheet | Needs review | Hands/legs bundled; violet/blue crop y133,h514; green y129,h518. Verify sleeves/cape and foot registration; no separate hand layer. |
| `dist/character/walk-blue.png` | 2172×724 RGBA | 4 horizontal; cells 543×724 | Retained older outfit/leg sheet; not selected by current walk branch | Temporary | Hands/legs bundled; violet/blue crop y133,h514; green y129,h518. Verify sleeves/cape and foot registration; no separate hand layer. |
| `dist/character/walk-forest-hands.png` | 2172×724 RGBA | 4 horizontal; cells 543×724 | Retained older outfit/leg sheet; not selected by current walk branch | Temporary | Hands/legs bundled; violet/blue crop y133,h514; green y129,h518. Verify sleeves/cape and foot registration; no separate hand layer. |
| `dist/character/walk-forest.png` | 2172×724 RGBA | 4 horizontal; cells 543×724 | Retained older outfit/leg sheet; not selected by current walk branch | Temporary | Hands/legs bundled; violet/blue crop y133,h514; green y129,h518. Verify sleeves/cape and foot registration; no separate hand layer. |
| `dist/character/walk-green-hands.png` | 2172×724 RGBA | 4 horizontal; cells 543×724 | Browser active color sheet | Needs review | Hands/legs bundled; violet/blue crop y133,h514; green y129,h518. Verify sleeves/cape and foot registration; no separate hand layer. |
| `dist/character/walk-sheet.png` | 2172×724 RGBA | 4 horizontal; cells 543×724 | Retained older outfit/leg sheet; not selected by current walk branch | Temporary | Hands/legs bundled; violet/blue crop y133,h514; green y129,h518. Verify sleeves/cape and foot registration; no separate hand layer. |
| `dist/character/walk-violet-hands.png` | 2172×724 RGBA | 4 horizontal; cells 543×724 | B.1 violet outfit/legs/hands; browser active | Approved technical reference | Hands/legs bundled; violet/blue crop y133,h514; green y129,h518. Verify sleeves/cape and foot registration; no separate hand layer. |
| `dist/courtyard-chibi.png` | 1024×1536 RGB | 1 | B.1/browser environment source | Approved technical reference | Opaque large raster, not authored 80×80 terrain tiles. Decorations baked into image; mirrors/crops and edge blend control current map. |
| `dist/courtyard.png` | 1024×1536 RGB | 1 | Retained environment alternative, not current map source | Needs review | Opaque large raster, not authored 80×80 terrain tiles. Decorations baked into image; mirrors/crops and edge blend control current map. |
| `dist/enemies/green.png` | 317×256 RGBA | 1 | Browser slime tier sprite; absent from B.1 | Needs review | Single static PNG with procedural bounce; purple includes cloud/lightning silhouette. Browser draw sizes green37/red41/purple46; image bounds differ from collision. |
| `dist/enemies/purple.png` | 470×389 RGBA | 1 | Browser slime tier sprite; absent from B.1 | Needs review | Single static PNG with procedural bounce; purple includes cloud/lightning silhouette. Browser draw sizes green37/red41/purple46; image bounds differ from collision. |
| `dist/enemies/red.png` | 319×256 RGBA | 1 | Browser slime tier sprite; absent from B.1 | Needs review | Single static PNG with procedural bounce; purple includes cloud/lightning silhouette. Browser draw sizes green37/red41/purple46; image bounds differ from collision. |
| `dist/forest-canopy.png` | 1024×1536 RGB | 1 | B.1/browser environment source | Approved technical reference | Opaque large raster, not authored 80×80 terrain tiles. Decorations baked into image; mirrors/crops and edge blend control current map. |
| `dist/forest-ruins.png` | 1024×1536 RGB | 1 | Retained environment alternative, not current map source | Needs review | Opaque large raster, not authored 80×80 terrain tiles. Decorations baked into image; mirrors/crops and edge blend control current map. |
| `reference/approved-chibi-direction.png` | 1536×1024 RGB | 1 | Approved chibi direction concept (reference only) | Approved artwork | Composite presentation, not aligned sprites or tile atlas; do not extract unseen components as approved final art. |
| `reference/three-map-directions.png` | 1536×1024 RGB | 1 | Three retained map concepts; first direction selected earlier | Needs review | Composite presentation, not aligned sprites or tile atlas; do not extract unseen components as approved final art. |

## Godot copies and derived assets

| Godot path | Verified role / dimensions | Classification | Notes |
| --- | --- | --- | --- |
| `assets/original/body.png` | Original copy, 243×398 | Approved technical reference | Byte-identical source preserved; usage as above. |
| `assets/original/courtyard-chibi.png` | Original copy, 1024×1536 | Approved technical reference | Byte-identical source preserved; usage as above. |
| `assets/original/eyes.png` | Original copy, 243×398 | Approved technical reference | Byte-identical source preserved; usage as above. |
| `assets/original/forest-canopy.png` | Original copy, 1024×1536 | Approved technical reference | Byte-identical source preserved; usage as above. |
| `assets/original/hair_back.png` | Original copy, 391×516 | Approved technical reference | Byte-identical source preserved; usage as above. |
| `assets/original/hair_long.png` | Original copy, 399×496 | Approved technical reference | Byte-identical source preserved; usage as above. |
| `assets/original/staff.png` | Original copy, 190×425 | Approved technical reference | Byte-identical source preserved; usage as above. |
| `assets/original/walk-violet-hands.png` | Original copy, 2172×724 | Approved technical reference | Byte-identical source preserved; usage as above. |
| `assets/generated/world.png` | 1760×2560 RGBA, generated by prepare_assets.py | Approved technical reference | Ignored derivative, regenerated; Canvas/Pillow sampling/alpha rounding may differ. Not a production tile atlas. |
| `assets/map.json` | 32 rows × 22 columns; 322 open cells | Approved technical reference | Navigation/collision data, not artwork; generated from original carve rectangles. |
| `assets/original/SHA256.json` | Eight source checksums | Approved technical reference | Provenance check, not evidence of artistic approval or licensing. |

## Missing or procedural families

| Family | Existing evidence | Status / limitation |
| --- | --- | --- |
| Default wooden Staff, Wand, Codex | Approved equipment direction; only ornate Staff PNG exists | Needs review; source art not yet produced. Do not invent dimensions. |
| Shared neutral body / presentation coverage | Current body is a combined appearance | Needs review; no final separate shirtless/coverage template or limb animation set. |
| Eye shapes / blink sprites | One current shape, procedural skin rectangle blink | Needs review; no dedicated multi-shape/blink sheet. |
| Runtime hair palettes | Browser Silver/Rose/Blue/Gold/Brown/Midnight pixel tint; source hex colors in index.html | Temporary method; not an indexed production palette/mask. |
| Spell effects and non-Staff weapons | Browser draws fireball circles, arrows, Sword/Bow rectangles and slash particles | Temporary; no final spell/weapon sprite sheets, no B.1 combat. |
| UI icons | Browser CSS/text and procedural HUD shapes; Godot diagnostic text/joystick | Temporary; no dedicated final icon atlas or verified icon-size standard. |
| Enemy animations | Single PNG plus browser procedural squash/bounce | Needs review; no illustrated enemy walk/hit/death sheets. |

## Approval scope and known consistency risks

The owner confirmed B.1 presentation, map, animation and controls on iPhone. This approves the technical reference at its tested scale, not every retained option. Pale semi-transparent edges/preview-looking shading on some character pieces require future matte/halo review. Existing eyes/body/clothes overlap content; independent customization needs separation at production time. Earlier purple sleeve/hand and hat/hair contact concerns remain regression checks. No exact final head ratio, native pixel density, UI palette, new anchor coordinates or final color ramp is invented by this inventory.
