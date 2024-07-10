extends Node

signal change_lives_label(value)
signal reset_game

var game_over_scene = preload("res://Scenes/game_over.tscn")
var main_scene = preload("res://Scenes/world.tscn")
var game_over_instance

var lives:
	get:
		return lives 
	set(value):
		lives = value
		change_lives_label.emit(lives)
		if lives <= 0:
			game_over()

func _ready():
	lives = 3

func game_over():
	get_tree().paused = true
	game_over_instance = game_over_scene.instantiate()
	get_tree().root.add_child(game_over_instance)

func restart_game():
	get_tree().paused = false
	get_tree().root.remove_child(game_over_instance)
	reset_game.emit()
	lives = 3 
