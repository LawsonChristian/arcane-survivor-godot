extends Node2D
const Collision = preload("res://scripts/game/map_collision.gd")
var map := Collision.new()
var input_handler: Node
var moving := false
const SPEED := 155.0
func step(direction: Vector2, delta: float) -> void:
    var before := position
    position = map.move(position, direction.limit_length(1.0) * SPEED * delta)
    moving = position.distance_squared_to(before) > 0.00001
func _physics_process(delta: float) -> void:
    if input_handler: step(input_handler.movement(), delta)
