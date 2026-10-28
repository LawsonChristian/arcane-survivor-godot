extends Sprite2D
func _ready() -> void:
    texture = load("res://assets/generated/world.png")
    centered = false
    texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
