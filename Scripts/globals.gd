extends Node

signal change_lives_label(value)

var lives:
	get:
		return lives 
	set(value):
		lives = value
		change_lives_label.emit(lives)
		if lives <= 0:
			pass

func _ready():
	lives = 3
