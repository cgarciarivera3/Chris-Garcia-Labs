extends Node2D

@onready var stopwatch = get_tree().get_first_node_in_group("stopwatch")

func _ready() -> void:
	Audiostream.play_music_game()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		stopwatch.stopped = true
		var final_time = stopwatch.time
		
		if final_time < LevelCore.lvl3_best_time:
			LevelCore.lvl3_best_time = final_time
			LevelCore.lvl3_best_time_string = stopwatch.time_to_string()
			
		get_tree().call_deferred("change_scene_to_file","res://Assets/Scenes/Areas/level_select.tscn")
		LevelCore.lvl3_completed = true
