extends CharacterBody2D
class_name Player

const SPEED = 100

@onready var sprite = $AnimatedSprite2D

var bullet = preload("res://Scenes/bullet.tscn")

var can_shoot = true 

func _physics_process(delta):
	movement(delta)
	shoot()

func movement(delta):
	var input = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = input * SPEED * delta
	if velocity!=Vector2.ZERO:
		mouse_rotation()
	else:
		mouse_rotation(false)
	move_and_collide(velocity)

func mouse_rotation(movement=true):
	var mouse = get_local_mouse_position()
	var angle = snappedf(mouse.angle(), PI/4) / (PI/4)
	angle = wrapi(int(angle), 0, 8)
	match angle:
		0: sprite.play("east")
		1: sprite.play("southeast")
		2: sprite.play("south")
		3: sprite.play("southwest")
		4: sprite.play("west")
		5: sprite.play("northwest")
		6: sprite.play("north")
		7: sprite.play("northeast")
	if not movement:
		sprite.frame = 0

func shoot():
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_shoot:
		var dir = get_global_mouse_position() - position 
		var new_bullet = bullet.instantiate()
		new_bullet.dir = dir.normalized()
		new_bullet.position = position
		get_tree().root.add_child(new_bullet)
		can_shoot = false
		$ShootCooldown.start()

func _on_shoot_cooldown_timeout():
	can_shoot = true
