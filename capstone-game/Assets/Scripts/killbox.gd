extends Area2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.is_dead = true
		body.velocity = Vector2.ZERO
		body.animation_player.play("death")
		await body.animation_player.animation_finished
		get_tree().call_deferred("reload_current_scene")
