# Stage A.2 verification — 2026-10-28

Repository: https://github.com/LawsonChristian/arcane-survivor-godot

Preview: https://lawsonchristian.github.io/arcane-survivor-godot/

Successful run: https://github.com/LawsonChristian/arcane-survivor-godot/actions/runs/40643683723

Deployed source: `549926fdf13555bedc1c79f479ad1a9c85e543a0`.

## Passed

- GitHub identity, repository access, source writes and workflow-log retrieval verified.
- Separate repository created private, then made public after explicit owner approval because Pages was unavailable for private repositories on this account's plan.
- Pages publishing source set to GitHub Actions; HTTPS enforced by the default GitHub domain.
- Build job 122667462100 and deploy job 122667629949 both completed successfully.
- GitHub runner provisioned official `4.7.2.stable.official.ed1daf0bf` and matching templates.
- Scene import, GDScript parsing, headless scene startup and simulated touch movement/release checks passed.
- Release export passed; Compatibility renderer and `GODOT_THREADS_ENABLED = false` verified.
- Exported binaries are absent from tracked source. Official upload-pages-artifact/deploy-pages actions handled build output; no Git LFS.
- Post-deployment HTTP checks passed for all manifest files: HTML, JS, PCK, splash PNG, audio worklets and WASM. File sizes and SHA-256 hashes match the build manifest.
- WASM: 39,514,754 bytes; served as `application/wasm`. PCK: 6,168 bytes; served as `application/octet-stream`.

## Browser limitation / not yet passed

The HTTPS preview URL was opened in the cloud Chrome browser. The Godot loader displays and logs:

```text
The following features required to run Godot projects on the Web are missing:
WebGL2 - Check web browser configuration and hardware support
```

The prior HTTP secure-context warning is gone. The available browser cannot initialize the engine because WebGL2 is unavailable; successful HTTP delivery is not recorded as successful game initialization. No browser flags, hardware settings or security protections were altered. Real browser keyboard movement remains unverified. Physical iPhone Safari, touch, rotation, safe-area layout, FPS and resume behavior remain unverified until the owner tests.

A separate Chrome-extension metadata error also appeared in console; it originates from the browser extension rather than the Godot host.

## iPhone testing

1. Open the preview URL above directly in Safari. No GitHub login should be needed for the public preview.
2. Wait for the initial engine download (about 38 MiB uncompressed WASM).
3. Confirm the cyan placeholder diamond, Godot 4.7.2 label and FPS counter appear. If an error appears instead, report its exact wording.
4. Touch the playfield below the header and drag; a joystick should appear and move the diamond. Lift to stop.
5. Try portrait/landscape and switching away/back. Report scrolling, stuck movement, clipping and approximate FPS. Keyboard users can focus the canvas and try WASD/arrows.

## Reproducible updates

Use `python3 scripts/build.py` locally, or Actions → Godot 4.7.2 web preview → Run workflow on `main` to build/export/publish. ChatGPT Work can edit source and dispatch this workflow without the owner manually editing code.

Automatic-on-push publication is disabled. An attempted change to enable it was rejected by automatic approval review because it would add ongoing publication on future pushes beyond the immediate test. The safer manually dispatched workflow was used successfully. No bypass or alternate provider was used.

GitHub emitted a non-fatal Node.js 20 deprecation warning for configure-pages@v5 and a transitive upload-artifact action; those ran under Node.js 24 and both jobs succeeded. Action-version maintenance remains future work.

## Preservation / boundary

The original browser prototype was not edited or redeployed. Its checkout is clean and `dist/index.html` SHA-256 remains `81d3ed9233af4d2ed020c7ac69f07e63c13382c5232d0d3fe3c2a42c30e5d5a1`. Its artwork and save data were not touched.

No gameplay, artwork, spells, enemies, progression or customization were added. Stage B has not started. Stop for owner phone feedback.
