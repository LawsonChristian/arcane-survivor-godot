extends Node2D
var input_handler: Node
func _process(_delta: float) -> void: queue_redraw()
func _draw() -> void:
    var w := get_viewport_rect().size.x
    draw_rect(Rect2(0,0,w,65),Color("111827"))
    var font := ThemeDB.fallback_font
    draw_string(font,Vector2(12,24),"ARCANE SURVIVOR · B.1",HORIZONTAL_ALIGNMENT_LEFT,-1,18,Color("f7dda5"))
    draw_string(font,Vector2(12,49),"Godot 4.7.2 · FPS %d · Drag to explore" % Engine.get_frames_per_second(),HORIZONTAL_ALIGNMENT_LEFT,-1,14,Color("a7c9d3"))
    if input_handler and input_handler.touch_id != -1:
        draw_circle(input_handler.origin,56,Color(1,1,1,0.12))
        draw_circle(input_handler.origin+input_handler.touch_vector*56,20,Color(1,1,1,0.5))
