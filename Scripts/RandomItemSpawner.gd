extends Node2D

@export var random_items : Array[PackedScene]

func spawn_random_item(position_to_spawn_at):
	var random_no = randi()
	var random_item = random_items[2]
	var item = random_item.instantiate()
	item.position = position_to_spawn_at
	get_tree().root.add_child(item)
