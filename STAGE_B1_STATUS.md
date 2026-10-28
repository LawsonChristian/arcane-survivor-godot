# Stage B.1 — Map and temporary character integration

Scope: B.1 only. Stage A.2 iPhone Safari loading and touch movement were personally confirmed by the owner. B.1 physical device testing is pending.

## Implementation

- Existing source files and original PNGs were verified accessible before changes. Original browser index hash remains `81d3ed9233af4d2ed020c7ac69f07e63c13382c5232d0d3fe3c2a42c30e5d5a1`; its repository remains clean and was not redeployed.
- Map: 1760×2560 world, 22×32 grid, 80-unit cells, original ten carved rectangles, 322 open cells. Original ground crop, mirrored repetitions and 24-unit edge blending retained through a reproducible build-time Pillow compositor. Runtime draws a single static map texture.
- Temporary reference: long original hair/back hair, original body/eyes, violet Mage four-frame outfit/leg sheet and elaborate original staff. No hat. Original PNG bytes preserved with SHA256 manifest. No new artwork or destructive transformations.
- Character: same 128-unit coordinate space, foot origin (-64,-113), scale .68, 7 FPS walking / idle frame 1. Original layer order/crops, blink, small pose motion and independent floating staff retained. No skeleton or customization framework.
- Movement: 155 world units/sec, normalized keyboard vector, existing floating-touch/release/focus-reset handling. Collision follows the original four-corner 10-unit footprint and axis-separated wall sliding, adding small movement substeps to prevent tunnelling.
- Camera: .8 zoom, clamped to original bounds, 65-unit opaque HUD. Existing Godot logical viewport stretching remains for mobile controls.

## Scene / responsibility separation

`StageB1` wires `InputHandler`, `World`, `Player`, `TemporaryVisual`, and `HUD`. World transform is managed by `camera_rig.gd`; map display by `world.gd`; grid collision by `map_collision.gd`; movement by `player.gd`; appearance by `character_visual.gd`; input by `input_handler.gd`. The HUD retains FPS/version and joystick feedback. No combat or other excluded systems.

## Reproduction

`python3 scripts/build.py` provisions pinned Godot 4.7.2/templates, invokes `scripts/prepare_assets.py`, imports, validates every GDScript, tests scene/collision/touch/assets and exports. Pillow 11.3.0 is provisioned only if missing. Original PNGs live under `assets/original`; generated map texture is ignored and regenerated. Existing manual GitHub Pages workflow is unchanged. Compatibility renderer and single-threaded export retained.

## Verified locally

- All GDScript parse checks pass; full scene imports and loads.
- Simulated touch drag moves, release clears motion and stops; all 704 grid-cell centers match walkability; wall rejection, open movement and sliding pass.
- All six character textures and world texture load; world dimensions checked.
- Web export succeeds; required output and WASM signature checked.
- Source PNG hashes match originals. Generated world image visually inspected as an asset; this is not proof of actual rendered Godot visual parity.

## Differences / limits

Canvas and Pillow can select different nearest pixels at fractional sampling locations and round gradient/alpha values differently (the .06 tint is quantized to 15/255). The least disruptive current solution is this one-time texture; exact Canvas capture could replace it later if comparisons show visible differences. Environment decorations remain embedded in the same source artwork; no new props added.

Godot viewport stretching can show a different amount of world than the browser's CSS-pixel viewport on some screens, despite .8 logical zoom and unchanged sprite proportions. Character draws at subpixel coordinates rather than the browser's rounded player position. These require equal-viewport screenshots/device review. Exact visual parity is not claimed.

Real keyboard input and B.1 physical iPhone controls have not been confirmed here. The available cloud browser previously lacked WebGL2. No renderer/security workaround is used. Headless import confirms resources, not GPU rendering. No actual Godot map/character screenshot is claimed without a compatible renderer.

## Deployment

Pending this implementation's GitHub Pages workflow run. Preview remains https://lawsonchristian.github.io/arcane-survivor-godot/ . Results will be recorded after publication.

## Stop boundary

No enemies, combat, spells, levels, upgrades, customization UI, progression, new art/maps/audio, saving, monetization or final character architecture. Future shared-body/art-bible decisions remain deferred. Stop after B.1 for owner feedback; B.2 is not authorized.
