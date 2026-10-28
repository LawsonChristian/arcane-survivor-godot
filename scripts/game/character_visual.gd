extends Node2D
# Temporary fixed reference, not the future customization architecture.
var textures: Dictionary = {}
var elapsed := 0.0
var current_frame := 1
func _ready() -> void:
    scale = Vector2.ONE*0.68
    texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
    for key in ["body","eyes","hair_long","hair_back","walk-violet-hands","staff"]:
        textures[key] = load("res://assets/original/"+key+".png")
func _process(delta: float) -> void:
    elapsed += delta
    queue_redraw()
func layer(key: String, rect: Rect2) -> void:
    draw_texture_rect(textures[key],rect,false)
func _draw() -> void:
    if textures.is_empty(): return
    var moving: bool = get_parent().moving
    current_frame = int(elapsed*7.0)%4 if moving else 1
    var gait: float = [-1.0,0.0,1.0,0.0][current_frame] if moving else 0.0
    var bob: float = [-1.0,0.0,-1.0,0.0][current_frame] if moving else sin(elapsed*2)*0.7
    var base := Transform2D(gait*0.018,Vector2.ZERO)*Transform2D(0,Vector2(-64,-113+bob))
    draw_set_transform_matrix(base)
    layer("hair_back",Rect2(32,16,64,84))
    layer("body",Rect2(42,32,44,72))
    layer("eyes",Rect2(42,32,44,72))
    if fmod(elapsed,4.8)>4.65:
        for x in [50,69]:
            draw_rect(Rect2(x,50,10,10),Color("fbd1b9"))
            draw_rect(Rect2(x+1,56,8,2),Color("463340"))
    var sheet: Texture2D = textures["walk-violet-hands"]
    var width := float(sheet.get_width())/4
    draw_texture_rect_region(sheet,Rect2(37,67,54,46),Rect2(current_frame*width,133,width,514))
    draw_set_transform_matrix(base*Transform2D(0,Vector2(gait*0.8,0)))
    layer("hair_long",Rect2(31,12,66,82))
    var weapon := base*Transform2D(0,Vector2(97,78+sin(elapsed*2)*1.5))*Transform2D(gait*0.06,Vector2.ZERO)*Transform2D(0,Vector2(-88,-78))
    draw_set_transform_matrix(weapon)
    layer("staff",Rect2(82,43,24,54))
