extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Audiostream.stream == Audiostream.menu_music:
		return
	Audiostream.play_music_menu()
	

func _on_start_button_down() -> void:
	pass
	get_tree().change_scene_to_file("res://Assets/Scenes/Areas/level_select.tscn")

func _on_exit_button_down() -> void:
	get_tree().quit()
