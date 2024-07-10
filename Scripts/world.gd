extends Node2D

func _ready():
	Globals.connect("reset_game", _reset)

func _reset():
	$Player.position = Vector2(250, 226)
	$Player.reset_powerups()
