extends Node2D

var enemy = preload("res://Scenes/enemy.tscn")
var spawn_points = []

func _ready():
	for child in get_children():
		if child is Marker2D:
			spawn_points.append(child)

func _on_enemy_spawn_timer_timeout():
	var spawn_point = spawn_points.pick_random()
	var new_enemy = enemy.instantiate()
	new_enemy.position = spawn_point.position
	get_tree().root.add_child(new_enemy)
