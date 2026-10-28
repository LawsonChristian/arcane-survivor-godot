extends Node
const STICK_RADIUS := 56.0
var touch_id := -1
var origin := Vector2.ZERO
var point := Vector2.ZERO
var touch_vector := Vector2.ZERO
func handle(event: InputEvent) -> void:
    if event is InputEventScreenTouch:
        if event.pressed and touch_id == -1 and event.position.y > 65:
            touch_id = event.index
            origin = event.position
            point = event.position
        elif event.index == touch_id and (not event.pressed or event.canceled): clear_touch()
    elif event is InputEventScreenDrag and event.index == touch_id:
        point = event.position
        touch_vector = (point-origin).limit_length(STICK_RADIUS)/STICK_RADIUS
func _input(event: InputEvent) -> void: handle(event)
func clear_touch() -> void:
    touch_id = -1
    touch_vector = Vector2.ZERO
func _notification(what: int) -> void:
    if what == NOTIFICATION_APPLICATION_FOCUS_OUT or what == NOTIFICATION_APPLICATION_PAUSED: clear_touch()
func movement() -> Vector2:
    var key := Vector2(float(Input.is_physical_key_pressed(KEY_D) or Input.is_physical_key_pressed(KEY_RIGHT))-float(Input.is_physical_key_pressed(KEY_A) or Input.is_physical_key_pressed(KEY_LEFT)), float(Input.is_physical_key_pressed(KEY_S) or Input.is_physical_key_pressed(KEY_DOWN))-float(Input.is_physical_key_pressed(KEY_W) or Input.is_physical_key_pressed(KEY_UP))).limit_length(1.0)
    return key if key.length_squared() > 0 else touch_vector
