extends Area2D

var dir = Vector2.UP
const SPEED = 500

func _process(delta):
	position += SPEED * dir * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body is Enemy:
		queue_free()
		body.queue_free()
