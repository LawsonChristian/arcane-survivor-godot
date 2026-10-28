"""Verify deployed bytes and WASM MIME; does not prove browser initialization."""
import hashlib
import json
import os
import urllib.request

base = os.environ['PREVIEW_URL'].rstrip('/') + '/'
def get(path):
    with urllib.request.urlopen(base + path, timeout=120) as r:
        return r.read(), r.headers.get_content_type()
manifest = json.loads(get('build-manifest.json')[0])
for name, expected in manifest['files'].items():
    data, mime = get(name)
    assert len(data) == expected['bytes'], name + ': size mismatch'
    assert hashlib.sha256(data).hexdigest() == expected['sha256'], name + ': hash mismatch'
    if name.endswith('.wasm'):
        assert mime == 'application/wasm', 'WASM MIME is ' + mime
    print(name, len(data), mime, 'OK')
if os.environ.get('GITHUB_STEP_SUMMARY'):
    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as s:
        s.write('Preview: ' + base + '\n\nHTTP assets, checksums and WASM MIME passed. Browser initialization and physical iPhone touch still require testing.\n')
