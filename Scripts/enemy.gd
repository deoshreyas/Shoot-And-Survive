extends CharacterBody2D

var entered
const SPEED = 50 
var direction 

@onready var player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta):
	position = position.move_toward(player.position, delta*SPEED)
