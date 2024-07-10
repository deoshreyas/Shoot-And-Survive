extends CanvasLayer

func _ready():
	$Panel/Control/VBoxContainer/Button.grab_focus()
	$Panel/Control/VBoxContainer/WavesSurvived.text = "Waves: " + str(Globals.waves)

func _on_button_pressed():
	Globals.restart_game()
