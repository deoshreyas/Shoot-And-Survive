extends Node2D

@export var random_items : Array[PackedScene]

func spawn_random_item(position_to_spawn_at):
	#if randi() % 1 == 1: # 25% chance of spawning random item
	var random_item = random_items.pick_random()
	var item = random_item.instantiate()
	item.position = position_to_spawn_at
	get_tree().root.add_child(item)
