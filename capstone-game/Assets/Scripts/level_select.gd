extends Control

@onready var button: Button = %lvl1_button
@onready var button_2: Button = %lvl2_button
@onready var button_3: Button = %lvl3_button
@onready var lvl_1_locked: ColorRect = $lvl1_locked
@onready var lvl_2_locked: ColorRect = $lvl2_locked
@onready var lvl_3_locked: ColorRect = $lvl3_locked
@onready var lock_1: Sprite2D = $Lock1
@onready var lock_2: Sprite2D = $Lock2
@onready var open_lock_2: Sprite2D = $OpenLock2
@onready var open_lock_3: Sprite2D = $OpenLock3
@onready var lvl_1_bronze: Sprite2D = $lvl1_bronze
@onready var lvl_1_silver: Sprite2D = $lvl1_silver
@onready var lvl_1_gold: Sprite2D = $lvl1_gold
@onready var lvl_1_platinum: Sprite2D = $lvl1_platinum
@onready var lvl_2_bronze: Sprite2D = $lvl2_bronze
@onready var lvl_2_silver: Sprite2D = $lvl2_silver
@onready var lvl_2_gold: Sprite2D = $lvl2_gold
@onready var lvl_2_platinum: Sprite2D = $lvl2_platinum
@onready var lvl_3_bronze: Sprite2D = $lvl3_bronze
@onready var lvl_3_silver: Sprite2D = $lvl3_silver
@onready var lvl_3_gold: Sprite2D = $lvl3_gold
@onready var lvl_3_platinum: Sprite2D = $lvl3_platinum

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.grab_focus()
	$lvl1_time.text = "Best Time: " + str(LevelCore.lvl1_best_time_string)
	$lvl2_time.text = "Best Time: " + str(LevelCore.lvl2_best_time_string)
	$lvl3_time.text = "Best Time: " + str(LevelCore.lvl3_best_time_string)
	
	if Audiostream.stream != Audiostream.menu_music:
		Audiostream.play_music_menu()
	
	if LevelCore.lvl1_completed == true:
		lvl_1_locked.visible = false
		lock_1.visible = false
		open_lock_2.visible = true
	if LevelCore.lvl1_completed == false:
		lvl_1_locked.visible = true
		lock_1.visible = true
		open_lock_2.visible = false
		
	if LevelCore.lvl2_completed == true:
		lvl_2_locked.visible = false
		lock_2.visible = false
		open_lock_3.visible = true
	if LevelCore.lvl2_completed == false:
		lvl_2_locked.visible = true
		lock_2.visible = true
		open_lock_3.visible = false
		
	if LevelCore.lvl3_completed == true:
		lvl_3_locked.visible = false
	if LevelCore.lvl3_completed == false:
		lvl_3_locked.visible = true
	
	if LevelCore.lvl1_best_time < 11:
		lvl_1_bronze.visible = true
	if LevelCore.lvl1_best_time < 9:
		lvl_1_bronze.visible = false
		lvl_1_silver.visible = true
	if LevelCore.lvl1_best_time < 7.5:
		lvl_1_bronze.visible = false
		lvl_1_silver.visible = false
		lvl_1_gold.visible = true
	if LevelCore.lvl1_best_time < 7:
		lvl_1_bronze.visible = false
		lvl_1_silver.visible = false
		lvl_1_gold.visible = false
		lvl_1_platinum.visible = true
		
	if LevelCore.lvl2_best_time < 12:
		lvl_2_bronze.visible = true
	if LevelCore.lvl2_best_time < 10:
		lvl_2_bronze.visible = false
		lvl_2_silver.visible = true
	if LevelCore.lvl2_best_time < 8:
		lvl_2_bronze.visible = false
		lvl_2_silver.visible = false
		lvl_2_gold.visible = true
	if LevelCore.lvl2_best_time < 7.3:
		lvl_2_bronze.visible = false
		lvl_2_silver.visible = false
		lvl_2_gold.visible = false
		lvl_2_platinum.visible = true
		
	if LevelCore.lvl3_best_time < 13:
		lvl_3_bronze.visible = true
	if LevelCore.lvl3_best_time < 11:
		lvl_3_bronze.visible = false
		lvl_3_silver.visible = true
	if LevelCore.lvl3_best_time < 9:
		lvl_3_bronze.visible = false
		lvl_3_silver.visible = false
		lvl_3_gold.visible = true
	if LevelCore.lvl3_best_time < 7.5:
		lvl_3_bronze.visible = false
		lvl_3_silver.visible = false
		lvl_3_gold.visible = false
		lvl_3_platinum.visible = true
	
func _on_button_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		get_tree().change_scene_to_file("res://Assets/Scenes/Areas/Level 1.tscn")
	else:
		get_tree().change_scene_to_file("res://Assets/Scenes/Areas/Level 1.tscn")

func _on_button_2_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		null
	if LevelCore.lvl1_completed == true:
		get_tree().change_scene_to_file("res://Assets/Scenes/Areas/level_2.tscn")

func _on_button_3_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		null
	if LevelCore.lvl1_completed == true:
		get_tree().change_scene_to_file("res://Assets/Scenes/Areas/level_3.tscn")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Areas/main_menu.tscn")
