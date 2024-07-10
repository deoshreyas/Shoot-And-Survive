extends Node2D

var enemy = preload("res://Scenes/enemy.tscn")
var spawn_points = []
var spawn_delay = 2

func _ready():
	for child in get_children():
		if child is Marker2D:
			spawn_points.append(child)

func _on_enemy_spawn_timer_timeout():
	var spawn_point = spawn_points.pick_random()
	var new_enemy = enemy.instantiate()
	new_enemy.position = spawn_point.position
	get_tree().root.add_child(new_enemy)
	$EnemySpawnTimer.wait_time = spawn_delay

func _on_wave_timer_timeout():
	Globals.waves += 1
	if spawn_delay>0.5: 
		spawn_delay -= 0.05
