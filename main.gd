extends Node2D
## Stage A: isolated input/render/export test. No game content or persistence.

const SPEED: float = 220.0
const STICK_RADIUS: float = 56.0
var actor := Vector2(240, 380)
var touch_id: int = -1
var stick_origin := Vector2.ZERO
var stick_point := Vector2.ZERO
var touch_vector := Vector2.ZERO
var seconds: float = 0.0
var last_input: String = "Ready"
var font: Font = ThemeDB.fallback_font

func _ready() -> void:
    print("STAGE_A_READY Godot ", Engine.get_version_info()["string"])
    actor = get_viewport_rect().size * Vector2(0.5, 0.48)

func _input(event: InputEvent) -> void:
    if event is InputEventScreenTouch:
        if event.pressed and touch_id == -1 and event.position.y > 155:
            touch_id = event.index
            stick_origin = event.position
            stick_point = event.position
            last_input = "Touch held"
        elif event.index == touch_id and (not event.pressed or event.canceled):
            clear_touch()
    elif event is InputEventScreenDrag and event.index == touch_id:
        stick_point = event.position
        touch_vector = (stick_point - stick_origin).limit_length(STICK_RADIUS) / STICK_RADIUS
        last_input = "Touch moving"

func clear_touch() -> void:
    touch_id = -1
    touch_vector = Vector2.ZERO
    last_input = "Touch released"

func _notification(what: int) -> void:
    if what == NOTIFICATION_APPLICATION_FOCUS_OUT or what == NOTIFICATION_APPLICATION_PAUSED:
        clear_touch()

func _process(delta: float) -> void:
    seconds += delta
    var keyboard := Vector2(
        float(Input.is_physical_key_pressed(KEY_D) or Input.is_physical_key_pressed(KEY_RIGHT)) - float(Input.is_physical_key_pressed(KEY_A) or Input.is_physical_key_pressed(KEY_LEFT)),
        float(Input.is_physical_key_pressed(KEY_S) or Input.is_physical_key_pressed(KEY_DOWN)) - float(Input.is_physical_key_pressed(KEY_W) or Input.is_physical_key_pressed(KEY_UP))
    ).limit_length(1.0)
    var movement := keyboard if keyboard.length_squared() > 0.0 else touch_vector
    if keyboard.length_squared() > 0.0:
        last_input = "Keyboard moving"
    actor += movement * SPEED * minf(delta, 0.05)
    var area := get_viewport_rect().size
    actor.x = clampf(actor.x, 26.0, maxf(26.0, area.x - 26.0))
    actor.y = clampf(actor.y, 175.0, maxf(175.0, area.y - 115.0))
    queue_redraw()

func line(text: String, at: Vector2, size: int, color: Color) -> void:
    draw_string(font, at, text, HORIZONTAL_ALIGNMENT_LEFT, -1, size, color)

func _draw() -> void:
    var area := get_viewport_rect().size
    var white := Color("e9f4ff")
    var muted := Color("9aafc7")
    var cyan := Color("68e6d0")
    draw_rect(Rect2(Vector2.ZERO, area), Color("101b2b"))
    for x in range(0, int(area.x), 40):
        draw_line(Vector2(x, 155), Vector2(x, area.y - 98), Color("1a2c40"))
    for y in range(155, int(area.y - 98), 40):
        draw_line(Vector2(0, y), Vector2(area.x, y), Color("1a2c40"))
    draw_rect(Rect2(0, 0, area.x, 155), Color("142337"))
    line("ARCANE SURVIVOR", Vector2(22, 36), 25, white)
    line("STAGE A  /  GODOT WORKFLOW TEST", Vector2(22, 62), 15, cyan)
    line("Godot " + str(Engine.get_version_info()["string"]), Vector2(22, 89), 17, muted)
    line("FPS  %d" % Engine.get_frames_per_second(), Vector2(22, 119), 21, cyan)
    line("X %d   Y %d" % [actor.x, actor.y], Vector2(190, 119), 17, white)
    line(last_input, Vector2(22, 143), 14, muted)
    draw_circle(actor + Vector2(0, 22), 22, Color(0, 0, 0, 0.25))
    var diamond := PackedVector2Array([actor + Vector2(0, -25), actor + Vector2(23, 0), actor + Vector2(0, 25), actor + Vector2(-23, 0)])
    draw_colored_polygon(diamond, cyan)
    draw_polyline(PackedVector2Array([diamond[0], diamond[1], diamond[2], diamond[3], diamond[0]]), white, 2.0)
    draw_rect(Rect2(actor + Vector2(-9, -5), Vector2(5, 7)), Color("142337"))
    draw_rect(Rect2(actor + Vector2(4, -5), Vector2(5, 7)), Color("142337"))
    if touch_id != -1:
        draw_circle(stick_origin, STICK_RADIUS, Color(0.4, 0.9, 0.82, 0.1))
        draw_arc(stick_origin, STICK_RADIUS, 0, TAU, 48, cyan, 2.0)
        draw_circle(stick_origin + touch_vector * STICK_RADIUS, 21, cyan)
    else:
        draw_arc(Vector2(76, area.y - 180), STICK_RADIUS, 0, TAU, 48, Color("354e63"), 2.0)
        draw_circle(Vector2(76, area.y - 180), 18, Color("354e63"))
    draw_rect(Rect2(0, area.y - 98, area.x, 98), Color("142337"))
    line("Touch + drag the playfield to move", Vector2(22, area.y - 63), 19, white)
    line("Keyboard: WASD or arrow keys", Vector2(22, area.y - 36), 17, muted)
    line("Placeholder only • no game content or saves", Vector2(22, area.y - 13), 13, muted)
