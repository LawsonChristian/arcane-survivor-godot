#!/usr/bin/env python3
"""Provision pinned Godot on Linux x86_64, validate, launch smoke test, export Web."""
import hashlib, json, os, platform, shutil, subprocess, urllib.request, zipfile, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
VERSION = '4.7.2'
CACHE = ROOT / '.toolchain'
CACHE.mkdir(exist_ok=True)
BASE = f'https://github.com/godotengine/godot/releases/download/{VERSION}-stable/'

def download(name):
    target = CACHE / name
    if not target.exists():
        temp = target.with_suffix(target.suffix + '.part')
        print('Downloading', name, flush=True)
        urllib.request.urlretrieve(BASE + name, temp)
        temp.replace(target)
    return target

binary = os.environ.get('GODOT_BIN') or shutil.which('godot4') or shutil.which('godot')
if not binary:
    if platform.system() != 'Linux' or platform.machine() != 'x86_64':
        raise SystemExit('Install Godot 4.7.2 and set GODOT_BIN to its executable.')
    name = f'Godot_v{VERSION}-stable_linux.x86_64'
    target = CACHE / name
    if not target.exists():
        with zipfile.ZipFile(download(name + '.zip')) as z:
            target.write_bytes(z.read(name))
        target.chmod(0o755)
    binary = str(target)
actual = subprocess.check_output([binary, '--version'], text=True).strip()
if not actual.startswith(VERSION + '.stable.'):
    raise SystemExit('Wrong engine version: ' + actual)
print('Engine:', actual, flush=True)
data_home = Path(os.environ.get('XDG_DATA_HOME', str(Path.home() / '.local/share')))
templates = data_home / 'godot/export_templates' / f'{VERSION}.stable'
required = ['web_nothreads_release.zip', 'web_nothreads_debug.zip']
if not all((templates / n).exists() for n in required):
    templates.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(download(f'Godot_v{VERSION}-stable_export_templates.tpz')) as z:
        for n in required + ['version.txt']:
            (templates / n).write_bytes(z.read('templates/' + n))

def run(*args):
    result = subprocess.run([binary, '--headless', '--path', str(ROOT), *args], cwd=ROOT, capture_output=True, text=True, timeout=180)
    output = result.stdout + result.stderr
    print(output, flush=True)
    if result.returncode or 'SCRIPT ERROR:' in output or '\nERROR:' in output:
        raise SystemExit('Godot check/export failed: ' + ' '.join(args))
    return output

subprocess.run([sys.executable, str(ROOT / 'scripts/prepare_assets.py')], check=True)
run('--editor', '--import')
for script in sorted(ROOT.rglob('*.gd')):
    if '.godot' not in script.parts and '.toolchain' not in script.parts:
        run('--check-only', '--script', str(script))
run('--script', 'scripts/verify_input.gd')
boot = run('--quit-after', '10')
if 'STAGE_B1_READY' not in boot:
    raise SystemExit('Main scene did not report readiness')
(ROOT / 'dist').mkdir(exist_ok=True)
run('--export-release', 'Web', str(ROOT / 'dist/index.html'))
required_output = ['index.html', 'index.js', 'index.wasm', 'index.pck']
for name in required_output:
    p = ROOT / 'dist' / name
    if not p.is_file() or p.stat().st_size == 0:
        raise SystemExit('Missing export file: ' + name)
if (ROOT / 'dist/index.wasm').read_bytes()[:4] != b'\x00asm':
    raise SystemExit('Invalid WASM signature')
manifest = {p.name: {'bytes': p.stat().st_size, 'sha256': hashlib.sha256(p.read_bytes()).hexdigest()} for p in sorted((ROOT / 'dist').iterdir()) if p.is_file() and p.name != 'build-manifest.json'}
(ROOT / 'dist/build-manifest.json').write_text(json.dumps({'engine': actual, 'files': manifest}, indent=2) + '\n')
print('STAGE_A_EXPORT_OK', flush=True)
