class_name LevelTileMap extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelManager.change_tilemap_bounds(get_tilemap_bounds())
	pass # Replace with function body.


func get_tilemap_bounds() -> Array[Vector2]:
	var bounds: Array[Vector2] = []
	# top left
	bounds.append(
		Vector2(get_used_rect().position * 32)
	)
	# bottom right
	bounds.append(
		Vector2(get_used_rect().end * 32)
	)
	return bounds
