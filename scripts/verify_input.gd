extends SceneTree

func _initialize() -> void:
    call_deferred("verify")

func verify() -> void:
    var scene := load("res://main.tscn") as PackedScene
    assert(scene != null)
    var test := scene.instantiate()
    root.add_child(test)
    await process_frame
    var before: Vector2 = test.actor
    var press := InputEventScreenTouch.new()
    press.index = 0
    press.pressed = true
    press.position = Vector2(100, 300)
    test._input(press)
    var drag := InputEventScreenDrag.new()
    drag.index = 0
    drag.position = Vector2(156, 300)
    test._input(drag)
    test._process(0.05)
    assert(test.actor.x > before.x)
    press.pressed = false
    test._input(press)
    assert(test.touch_vector == Vector2.ZERO)
    var stopped: Vector2 = test.actor
    test._process(0.05)
    assert(test.actor == stopped)
    print("STAGE_A_TOUCH_SIMULATION_OK: drag moves, release stops")
    test.queue_free()
    quit(0)
