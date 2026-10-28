extends RefCounted
const CELL := 80
const SIZE := Vector2(1760, 2560)
var grid: Array = JSON.parse_string(FileAccess.get_file_as_string("res://assets/map.json"))
func is_open(p: Vector2) -> bool:
    var cell := Vector2i(floor(p.x / CELL), floor(p.y / CELL))
    return cell.x >= 0 and cell.y >= 0 and cell.x < 22 and cell.y < 32 and grid[cell.y][cell.x]
func can_stand(p: Vector2) -> bool:
    for corner in [Vector2(-10,-10),Vector2(10,-10),Vector2(-10,10),Vector2(10,10)]:
        if not is_open(p + corner): return false
    return true
func move(from: Vector2, delta: Vector2) -> Vector2:
    var result := from
    # Substeps retain the prototype's X/Y sliding and prevent large-step tunnelling.
    var steps := maxi(1, ceili(delta.length() / 5.0))
    var step := delta / steps
    for i in steps:
        if can_stand(result + Vector2(step.x,0)): result.x += step.x
        if can_stand(result + Vector2(0,step.y)): result.y += step.y
    return result
