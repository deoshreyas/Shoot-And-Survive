extends Area2D

var dir = Vector2.UP
const SPEED = 500

func _process(delta):
	position += SPEED * dir * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
