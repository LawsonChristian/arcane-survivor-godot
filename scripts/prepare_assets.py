"""Reproduce the Canvas map once at build time; originals remain byte-for-byte intact."""
from pathlib import Path
import json, hashlib, sys, subprocess
try:
 from PIL import Image, ImageDraw, ImageOps
except ImportError:
 target=Path(__file__).resolve().parents[1]/'.toolchain/python'
 subprocess.run([sys.executable,'-m','pip','install','--target',str(target),'Pillow==11.3.0'],check=True)
 sys.path.insert(0,str(target))
 from PIL import Image, ImageDraw, ImageOps
root=Path(__file__).resolve().parents[1]
out=root/'assets/generated';out.mkdir(exist_ok=True)
rects=[[9,2,12,29],[7,25,14,29],[4,19,17,22],[3,16,7,22],[14,14,18,22],[8,12,15,16],[4,8,17,11],[3,6,7,11],[14,5,18,11],[7,2,14,5]]
grid=[[any(a<=x<=c and b<=y<=d for a,b,c,d in rects) for x in range(22)] for y in range(32)]
(root/'assets/map.json').write_text(json.dumps(grid))
size=(1760,2560);forest=Image.open(root/'assets/original/forest-canopy.png').convert('RGBA');ground=Image.open(root/'assets/original/courtyard-chibi.png').convert('RGBA')
def repeat(im,box,tile):
 result=Image.new('RGBA',size);base=im.crop(box).resize(tile,Image.Resampling.NEAREST)
 for y in range(0,size[1],tile[1]):
  for x in range(0,size[0],tile[0]):
   part=ImageOps.mirror(base) if x//tile[0]%2 else base
   if y//tile[1]%2:part=ImageOps.flip(part)
   result.paste(part,(x,y))
 return result
world=repeat(forest,(0,0,*forest.size),(1120,1680))
floor=repeat(ground,(210,200,814,1280),(640,1144));floor=Image.alpha_composite(floor,Image.new('RGBA',size,(35,27,18,15)))
mask=Image.new('L',size);md=ImageDraw.Draw(mask)
for y,row in enumerate(grid):
 for x,open_ in enumerate(row):
  if open_:md.rectangle((x*80,y*80,x*80+79,y*80+79),fill=255)
world.paste(floor,(0,0),mask)
for y,row in enumerate(grid):
 for x,open_ in enumerate(row):
  if not open_:continue
  for dx,dy in [(-1,0),(1,0),(0,-1),(0,1)]:
   nx,ny=x+dx,y+dy
   if 0<=nx<22 and 0<=ny<32 and grid[ny][nx]:continue
   sx=(x*83+y*53)%800;sy=(y*97+x*41)%1300
   patch=forest.crop((sx,sy,sx+180,sy+180)).resize((80,80),Image.Resampling.NEAREST)
   alpha=patch.getchannel('A');pixels=alpha.load()
   for py in range(80):
    for px in range(80):
     distance=px+.5 if dx<0 else 79.5-px if dx>0 else py+.5 if dy<0 else 79.5-py
     pixels[px,py]=round(pixels[px,py]*.85*max(0,1-distance/24))
   patch.putalpha(alpha);world.alpha_composite(patch,(x*80,y*80))
world.save(out/'world.png')
manifest={p.name:hashlib.sha256(p.read_bytes()).hexdigest() for p in (root/'assets/original').glob('*.png')}
(root/'assets/original/SHA256.json').write_text(json.dumps(manifest,indent=2)+'\n')
print('ASSETS_READY: 1760x2560 world,',sum(map(sum,grid)),'open cells')
