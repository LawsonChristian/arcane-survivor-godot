# Arcane Survivor — Godot preview

Current milestone: **B.1**, original forest layout plus one temporary layered Mage reference. This is not final character-art approval or the final customization architecture. No combat or progression.

Preview: https://lawsonchristian.github.io/arcane-survivor-godot/

See [STAGE_B1_STATUS.md](STAGE_B1_STATUS.md) for implementation, tests, visual differences and device-testing limits. Stage A.2 was confirmed by the owner on iPhone Safari; B.1 still requires device feedback.

## Reproduce

Run `python3 scripts/build.py` on Linux x86_64 with Python 3/network access, or set `GODOT_BIN` to an existing Godot 4.7.2 executable. The build provisions matching templates, regenerates the static map from untouched originals, imports/validates all scripts, tests the scene and exports a single-threaded Compatibility build. Generated exports/cache/map texture are excluded from Git. Original assets and SHA-256 manifest are retained in `assets/original/`.

Publish through Actions → Godot 4.7.2 web preview → Run workflow on main. The existing manually triggered Pages workflow is unchanged; no personal token or Git LFS is needed. Work can edit code and publish updates conversationally.

## Phone test

Refresh the preview in Safari. Look for B.1 in the HUD, then drag below the header to explore the pathways. Lift to stop. Check walls, sprite animation, scale and rotating the device. Keyboard controls use WASD/arrows. Cloud Chrome currently lacks WebGL2, so screenshots of actual game rendering and keyboard input have not been verified here.

Original browser prototype/artwork/save data are unchanged. Stage B.2 is not authorized.
