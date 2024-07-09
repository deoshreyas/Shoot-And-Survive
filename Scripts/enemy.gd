extends CharacterBody2D
class_name Enemy

const SPEED = 50 
var direction : Vector2
var entered
var alive = true

@onready var player = get_tree().get_first_node_in_group("Player")

signal hit_player

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
	if alive:
		if entered:
			direction = player.position - position
		direction = direction.normalized()
		velocity = direction * SPEED * delta
		move_and_collide(velocity)

func _on_entry_timer_timeout():
	entered = true

func _on_area_2d_body_entered(body):
	if body is Player:
		Globals.lives -= 1

func enemy_death():
	alive = false
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite2D.play("death")
	$DespawnTimer.start()
	$RandomItemSpawner.spawn_random_item(position)

func _on_timer_timeout():
	queue_free()
