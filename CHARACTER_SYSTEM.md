# Arcane Survivor — Character System Specification

Stage B.2 · documentation only. Related: [ART_BIBLE.md](ART_BIBLE.md), [ASSET_INVENTORY.md](ASSET_INVENTORY.md), [ART_PRODUCTION_PLAN.md](ART_PRODUCTION_PLAN.md).

## Established requirements

One shared underlying body for male and female presentations: identical anatomy proportions, canvas registration, limb locations and animation layout. Appearances come from modular presentation/coverage, clothing, hairstyles and accessories, not separate incompatible rigs. Support a shirtless male presentation and a chest-covering female presentation. Do not require nudity or gender-specific proportions to provide those options. Do not produce or modify body art here.

The approved baseline is four forward-facing walk frames at approximately 7 FPS with synchronized components. No back-facing sprites. Diagonal/three-quarter animation is possible only with later approval. The original elaborate staff remains preserved. Future Mage categories are Staff, Wand and Codex, with a simple wooden default Staff and independent floating weapon cosmetics.

## Current implementation versus target

B.1 renders one fixed appearance with six textures and hard-coded crops. Body already includes eyes and coverage; the eye PNG contains a skin-colored face strip; the outfit animation includes arms, hands and legs. Hair and body are static images moved procedurally. There is no data-driven character catalog, selection UI, body-presentation mode, eye-shape catalog or save system in Godot.

The final system is **proposed**, not implemented. Keep B.1 available as a comparison reference until separately approved components can replace it without regressions.

## Proposed composition and alignment contract

Use a common character root and one shared animation clock. Each component declares compatible body/registration version, frame mapping, source rectangles, logical placement, palette channels and draw parts. Body presentation must never select a different limb geometry or alter the root. The existing (64,113) foot point in 128-unit space is the recommended initial registration; final authoring pixels and any anchor adjustments require the base-body review.

A base template should contain full head/torso/arms/hands/legs at common poses. Decide which body areas a garment occludes using documented masks/coverage regions; do not erase the underlying master for each outfit. Shirtless presentation shows the same torso and limbs; chest-covering presentation adds a fitted coverage garment using the same anatomy and frames. Coverage remains visible when an outer outfit is removed. Selection validation must prevent a required covering from disappearing because a slot is empty. The coverage solution is a proposed implementation of the established presentation requirement, pending owner approval.

Existing eyes must eventually be separated from body/skin so changing shapes does not leave two eye sets. That future cleanup is asset work, not permission to alter B.1 now. Eyes, brows, cheeks and blinking need distinct ownership to avoid duplicate face features. Body-color changes must not accidentally recolor eye highlights, outlines or fabric.

| Component | Proposed alignment/behavior |
| --- | --- |
| Body presentation | Shared body template and coverage policy; no gender-dependent anchor offsets |
| Eye shape | Same face plane and approved eye region; shape may define its own blink frames/mask |
| Eye color | Palette ID applied only to declared iris channels, independently of shape |
| Hairstyle | May supply back, front and foreground strands; follows common head pose and approved hat compatibility profile |
| Hair color | Independent palette ID; preserve outline/shadow/highlight roles, no whole-image tint of skin/eyes |
| Outfit | Covers shared body regions; declares garment, sleeve/hand occlusion, back cape and front pieces; cannot change limb proportions |
| Outfit color | Palette variant of the same silhouette and frame geometry; proposed masks/ramp swaps rather than extra anatomy sheets |
| Hats/accessories | Attach to proposed head/body/face planes; no arbitrary offsets per combination. Define optional hair-under-hat variant if genuinely needed |
| Weapon cosmetic | Maps to an equipment category; owns texture/pivot/hover and optional emission markers independently of body |

Suggested semantic anchors are `feet`, `head`, `face`, `neck`, `shoulder_left/right`, `hand_left/right`, and `weapon_float`. Only the reference feet and current rectangles/pivot in ART_BIBLE are measured. No exact numeric coordinates are assigned to the new semantic anchors until the approved body poses establish them. Store those coordinates once per template/pose; components may have declared local offsets, never hidden case-by-case renderer fixes.

## Proposed layer ordering

Order back-to-front; ranks are ordering examples, not implemented z-index constants.

| Order | Plane / purpose |
| --- | --- |
| 1 | Rear accessories and back garment/cape portions, where required |
| 2 | Back hair |
| 3 | Shared body and limbs |
| 4 | Eyes/face expression parts |
| 5 | Coverage garment and main outfit/sleeves/boots |
| 6 | Front hair |
| 7 | Hat base/crown, then designated over-hat strands or ornament parts |
| 8 | Front accessories (glasses, brooches, etc.), each explicitly assigned to its required face/garment plane |
| 9 | Independent floating weapon, matching B.1 foreground placement by default |

This preserves B.1's relative back hair → body → eyes → clothing → front hair → weapon ordering. The hat position is a proposed extension from the original browser. A glasses layer needs a face plane rather than blindly covering every hat. Capes/long hair can require multiple pieces around body/clothes. Hands can be body parts masked by sleeves or synchronized overlay parts; they must be owned by a single component at each pixel. Do not draw duplicate hands from both body and clothing. Weapon orbit/behind-body cases would require later explicit layer rules, not a new always-on system now.

## Shared animation

Define a single `walk_front` four-pose timeline: frames 0,1,2,3 at ~7 FPS (about .143 seconds per frame). Idle uses reference frame 1. No phase reset per layer or independently running hairstyle timers. Moving into a wall should not animate walking if there is no displacement, matching B.1. All visible components resolve the same pose index; a static layer may map all poses to one image, while sleeve/boot/body pieces supply corresponding poses. A hat follows head transform, not an independent bob that opens a gap.

The current timing is real but only outfit/leg art has four illustrated frames. New full-body frame requirements must be approved per production step. Shared registration prevents combinatorial full-character sheets; it does not remove the need to draw each animated garment/body part's four poses. Blink is independent expression timing; current skin-colored rectangle blink is a temporary reference and must not be assumed valid for every eye shape or skin appearance.

Future animation changes must preserve existing frame mappings or add a versioned state. Do not mirror a front sprite into a back view. Test diagonal movement using forward presentation now; art-facing variants require separate authorization. Do not change existing tilt/hover just because a future metadata design could support something else.

## Proposed data specification (not runtime/save implementation)

Use stable string IDs and a schema version, separate visual appearance from class/combat equipment. Display labels, file paths and list indexes are not persistent identities. Example fields, with **illustrative IDs only**:

```json
{
  "schema_version": 1,
  "body_template_id": "body.shared.v1",
  "body_presentation_id": "presentation.covered",
  "eye_shape_id": "eyes.soft",
  "eye_palette_id": "iris.violet",
  "hair_style_id": "hair.long",
  "hair_palette_id": "hair.silver",
  "outfit_style_id": "outfit.mage.standard",
  "outfit_palette_id": "outfit.violet",
  "hat_id": null,
  "accessory_ids": [],
  "weapon_cosmetic_id": "staff.wood.default"
}
```

These IDs do not exist in the current game. A proposed catalog entry holds component ID/revision, approved status, compatible template versions, parts/planes, animation maps, palette roles, anchor references and optional coverage/hat profiles. Proposed equipment data separately records `weapon_category` (Staff/Wand/Codex); a cosmetic must match the selected category and must not alter damage or casting stats. Whether eye left/right colors, skin palettes or additional body presentations exist is not newly approved here.

Validation rules: unknown IDs resolve to a documented safe default; incompatible cosmetics are not silently distorted; omitted hats mean none; mandatory coverage must survive missing outfit data. No ownership, purchase entitlement, save migration or UI code is designed as already implemented. The browser's numeric indexes/weapon strings must not be overwritten or migrated during this stage.

## Mage equipment presentation

Simple wooden Staff: modest readable wood silhouette, small fantasy accents only if approved. Wand: shorter/smaller category silhouette; Codex: readable book silhouette with approved floating orientation. Their exact silhouettes, dimensions, palettes and idle poses remain component approvals, not dimensions copied from the elaborate staff.

All float beside the character. Use one parent-independent weapon transform tied to the character root with a declared pivot. Preserve the elaborate purple-and-gold staff texture untouched as a future cosmetic candidate; preservation is not final cosmetic approval. Future casting/emission anchors must travel with weapon visuals, but no automatic spell/muzzle rule is assigned: COMBAT_DESIGN leaves per-spell emission behavior unresolved. No weapons must be permanently merged into the body sheets.

## Questions Requiring Owner Approval

Only the following decisions block starting final character production. Minor naming/atlas details can wait.

| Decision | Options | Recommended default and implementation consequence |
| --- | --- | --- |
| Final production pixel grid | Draw natively in a 128×128 frame; or retain larger masters with consistent mapped logical size | **Use 128-unit registration, approve a native 128×128 sample before committing.** It simplifies matching pixel density; it may simplify details compared with today's large raster sources. Larger masters preserve detail but need stricter sampling checks. No resampling is authorized yet. |
| Final body coverage design | Shared base plus interchangeable minimal coverage layer; or coverage integrated into separate appearance exports with identical anatomy | **Shared base plus coverage layer**, shirtless male torso / chest-covering female presentation with equivalent lower-body coverage. Choose the covering's visual design during the base-body review. This reduces duplicate animation and prevents coverage depending on outer outfits. |
| Where hands/limbs belong | Shared animated body limbs masked by garments; or each outfit bundles arms/hands as current sheets do | **Shared body limbs with garment masks/overlays.** More initial template/mask work, much more reliable shirtless/outfit combinations. Outfit-owned hands need duplicate approval and make consistency harder. |
| Mage outfit silhouette for all presentations | One unisex standard silhouette; or alternate garment cuts using the same anatomy/anchors | **One standard unisex silhouette first**, in violet/blue/green. This minimizes variants and fits the single shared body. Other cuts can be individual future cosmetics. |

These recommendations are pending choices, not implied consent to produce art. Exact eye shapes, first hairstyle set and wooden Staff design should be selected at their individual approval steps, not through a large upfront questionnaire. Approving these documents alone does not authorize B.3.
