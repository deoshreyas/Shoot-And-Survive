extends CanvasLayer
 
@onready var lives_label = $Panel/Lives

func _ready():
	lives_label.text = "x " + str(Globals.lives)
	Globals.connect("change_lives_label", _lives_label_change)

func _lives_label_change(lives):
	lives_label.text = "x " + str(lives)
