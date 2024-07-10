extends Area2D

func _on_body_entered(body):
	if body is Player:
		Globals.lives += 1
		queue_free()

func _on_despawn_timer_timeout():
	queue_free()
