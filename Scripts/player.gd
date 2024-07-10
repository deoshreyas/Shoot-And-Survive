extends CharacterBody2D
class_name Player

const DEFAULT_SPEED = 100
const DEFAULT_RELOAD_TIME = 1.0

var speed = 100

@onready var sprite = $AnimatedSprite2D

var bullet = preload("res://Scenes/bullet.tscn")

var can_shoot = true  

var reload_time = 1.0

func _physics_process(delta):
	movement(delta)
	shoot()

func movement(delta):
	var input = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = input * speed * delta
	if velocity!=Vector2.ZERO:
		mouse_rotation()
	else:
		mouse_rotation(false)
	if check_constraints():
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
		$ShootCooldown.wait_time = reload_time
		$ShootCooldown.start()
		SoundRoot.play("shoot")

func _on_shoot_cooldown_timeout():
	can_shoot = true

func increase_speed():
	speed = DEFAULT_SPEED * 3
	$SpeedPowerupTimer.start()

func increase_reload_speed():
	reload_time = reload_time / 4
	$ReloadPowerupTimer.start()

func _on_speed_powerup_timer_timeout():
	speed = DEFAULT_SPEED

func _on_reload_powerup_timer_timeout():
	reload_time = DEFAULT_RELOAD_TIME

func reset_powerups():
	speed = DEFAULT_SPEED
	reload_time = DEFAULT_RELOAD_TIME

func check_constraints():
	if position.x<507:
		if position.x>5:
			if position.y>5:
				if position.y<436:
					return true 
				else:
					position.y = 435
			else:
				position.y = 6 
		else:
			position.x = 6
	else:
		position.x = 506
	return false
