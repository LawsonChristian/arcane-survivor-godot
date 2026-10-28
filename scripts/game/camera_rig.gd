extends Node2D
var target: Node2D
const ZOOM := 0.8
func _process(_delta: float) -> void:
    if not target: return
    var area := get_viewport_rect().size
    var view := Vector2(area.x, area.y-65.0)/ZOOM
    var bounds := Vector2(1760,2560)
    var offset := target.position-view/2
    for axis in 2:
        offset[axis] = (bounds[axis]-view[axis])/2 if view[axis]>=bounds[axis] else clampf(offset[axis],0,bounds[axis]-view[axis])
    scale = Vector2.ONE*ZOOM
    position = Vector2(0,65)-offset*ZOOM
