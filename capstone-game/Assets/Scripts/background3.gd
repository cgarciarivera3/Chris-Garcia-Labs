extends TileMap

@onready var target = $"../Goal/Marker2D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"../Player".global_position.distance_to(target.global_position) < 30:
		set_cell(1, Vector2i(56, -16), 0, Vector2i(12, 10))
		set_cell(1, Vector2i(56, -15), 0, Vector2i(12, 11))
