# Arcane Survivor — Godot Stage A

Separate Godot 4.7.2 technical proof of concept: a background, movable placeholder, keyboard/touch controls, FPS counter and engine-version label. No existing game artwork, spells, enemies, progression, cosmetics or save data are included.

## Build

Run `python3 scripts/build.py` on Linux x86_64 with Python 3 and network access. It downloads the official pinned Godot 4.7.2 engine and matching export templates when missing, imports scenes, validates GDScript, checks scene startup and simulated touch input, then exports a single-threaded Compatibility build into ignored `dist/`. Set `GODOT_BIN` to an installed 4.7.2 executable to reuse it. The script checks required files and emits `dist/build-manifest.json` with SHA-256 hashes. The provisioning cache is ignored.

## Pages workflow

`.github/workflows/pages.yml` builds on an explicit Actions → Godot 4.7.2 web preview → Run workflow request. It uses official GitHub Pages artifact/deployment actions. Generated HTML/JS/WASM/PCK stay in the artifact, never in source control. No Git LFS. The deploy job uses the built-in short-lived Actions token with `pages: write` and `id-token: write`; no personal token is required.

This test repository is public with the owner's approval. GitHub Pages uses GitHub Actions as its publishing source. Publishing is manually triggered for each approved test build; automatic-on-push deployment is not enabled. Future updates can still be made and published by ChatGPT Work without the owner editing code.

The HTTP check verifies deployed asset sizes/hashes and `application/wasm`; it cannot establish browser initialization or input. GitHub Pages uses HTTPS and standard MIME mappings. Actual delivery must be checked after publication. No custom cross-origin isolation headers are assumed; the export is single-threaded and requires WebAssembly/WebGL2.

## iPhone test

Open https://lawsonchristian.github.io/arcane-survivor-godot/ in Safari and wait for the initial engine download. Confirm the cyan diamond, Godot 4.7.2 label and FPS display. Touch below the header and drag to move; lift to stop. Try edges, portrait/landscape and switching away/back. Report blank screens, errors, scrolling, stuck input or clipped text. Keyboard testing uses WASD/arrows with canvas focus. Physical iPhone touch/Safari remain unverified.

Stage B is not authorized. The existing browser game and its hosting are separate and unchanged.

See [STAGE_A2_STATUS.md](STAGE_A2_STATUS.md) for actual deployment results and the cloud-browser WebGL2 limitation.
