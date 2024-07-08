extends CharacterBody2D

const SPEED = 75

@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	movement(delta)
	mouse_rotation()

func movement(delta):
	var input = Input.get_vector("left", "right", "up", "down").normalized()
	velocity = input * SPEED * delta
	var anim = ""
	if input!=Vector2.ZERO:
		if input.y<0:
			anim += "north"
		elif input.y>0:
			anim += "south"
		if input.x<0:
			anim += "west"
		elif input.x>0:
			anim += "east"
		sprite.play(anim)
	else:
		sprite.play("idle")
	move_and_collide(velocity)

func mouse_rotation():
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
