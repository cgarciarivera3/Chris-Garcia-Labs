extends Node2D

@export var player_controller : Player
@export var animation_player : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta: float) -> void:
	if player_controller.is_blinking:
		return
	
	if animation_player.current_animation == "death":
		return
	
	if player_controller.direction == 1:
		sprite.flip_h = false
	elif player_controller.direction == -1:
		sprite.flip_h = true

	if abs(player_controller.velocity.x) > 0.0:
		animation_player.play("run")
	else:
		animation_player.play("idle")
		
	if player_controller.velocity.y < 0.0:
		animation_player.play("jump")
	elif player_controller.velocity.y > 0.0:
		animation_player.play("fall")
	
