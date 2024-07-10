extends CanvasLayer

func _ready():
	$Panel/Control/VBoxContainer/Button.grab_focus()

func _on_button_pressed():
	Globals.restart_game()
