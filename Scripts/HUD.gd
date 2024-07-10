extends CanvasLayer
 
@onready var lives_label = $Panel/Lives
@onready var waves_label = $Panel/Waves

func _ready():
	lives_label.text = "x " + str(Globals.lives)
	waves_label.text = str(Globals.waves)
	Globals.connect("change_lives_label", _lives_label_change)
	Globals.connect("change_waves_label", _waves_label_change)

func _lives_label_change(lives):
	lives_label.text = "x " + str(lives)

func _waves_label_change(waves):
	waves_label.text = str(waves)
