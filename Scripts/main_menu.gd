extends Control

var music = true

func _ready():
	$ColorRect/VBoxContainer/Start.grab_focus()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/world.tscn")

func _on_music_pressed():
	if music:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
		music = false 
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		music = true 

func _on_quit_pressed():
	get_tree().quit()
