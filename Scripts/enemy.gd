extends CharacterBody2D

const SPEED = 50 
var direction : Vector2

@onready var player = get_tree().get_first_node_in_group("Player")

func _ready():
	var centre = get_viewport_rect().get_center()
	var entered = false
	var distance = centre - position
	if abs(distance.x) > abs(distance.y): # use abs() in expression otherwise the bats only move in one direction
		direction.x = distance.x 
		direction.y = 0
	else:
		direction.y = distance.y
		direction.x = 0

func _physics_process(delta):
	direction = direction.normalized()
	velocity = direction * SPEED * delta
	move_and_collide(velocity)
	print(velocity)
