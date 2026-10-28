extends Node2D
func _ready() -> void:
    $World/Player.input_handler = $InputHandler
    $World.target = $World/Player
    $HUD.input_handler = $InputHandler
    print("STAGE_B1_READY")
