extends SceneTree
func _initialize() -> void: call_deferred("verify")
func verify() -> void:
    var scene: PackedScene = load("res://main.tscn")
    assert(scene != null)
    var test := scene.instantiate()
    root.add_child(test)
    await process_frame
    var player: Node2D = test.get_node("World/Player")
    var input_handler: Node = test.get_node("InputHandler")
    player.set_physics_process(false)
    var before := player.position
    var press := InputEventScreenTouch.new()
    press.index = 0
    press.pressed = true
    press.position = Vector2(100,300)
    input_handler.handle(press)
    var drag := InputEventScreenDrag.new()
    drag.index = 0
    drag.position = Vector2(156,300)
    input_handler.handle(drag)
    player.step(input_handler.movement(),0.05)
    assert(player.position.x > before.x)
    press.pressed = false
    input_handler.handle(press)
    assert(input_handler.touch_vector == Vector2.ZERO)
    var stopped := player.position
    player.step(input_handler.movement(),0.05)
    assert(player.position == stopped)
    # Every open-cell center remains valid. Every solid-cell center rejects entry.
    var count := 0
    for y in 32:
        for x in 22:
            var p := Vector2(x*80+40,y*80+40)
            assert(player.map.can_stand(p) == player.map.grid[y][x])
            if player.map.grid[y][x]: count += 1
    assert(count == 322)
    player.position = Vector2(570,2200)
    player.step(Vector2.LEFT,1.0)
    assert(player.position.x >= 570)
    player.position = Vector2(920,2200)
    player.step(Vector2.UP,0.1)
    assert(player.position.y < 2200)
    # Wall sliding: X blocked at the west boundary, Y still moves.
    player.position = Vector2(570,2200)
    player.step(Vector2(-1,-1),0.1)
    assert(player.position.x >= 570 and player.position.y < 2200)
    var visual: Node = player.get_node("TemporaryVisual")
    assert(visual.textures.size() == 6)
    for texture in visual.textures.values(): assert(texture != null)
    var map: Sprite2D = test.get_node("World/Map")
    assert(map.texture != null and map.texture.get_size() == Vector2(1760,2560))
    print("STAGE_B1_TESTS_OK: touch/release, 704 grid centers, walls/sliding, movement, textures")
    test.queue_free()
    quit(0)
