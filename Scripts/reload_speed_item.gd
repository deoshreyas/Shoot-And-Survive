extends Area2D

func _on_body_entered(body):
	if body is Player:
		body.increase_reload_speed()
		queue_free()
