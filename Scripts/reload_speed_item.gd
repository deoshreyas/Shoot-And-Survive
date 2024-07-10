extends Area2D

func _on_body_entered(body):
	if body is Player:
		body.increase_reload_speed()
		SoundRoot.play("pickup")
		queue_free()

func _on_despawn_timer_timeout():
	queue_free()
