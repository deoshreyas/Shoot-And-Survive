extends Node2D

func _ready():
	$Bg.play()

func play(sound):
	if sound=="shoot":
		$Shoot.play()
	elif sound=="pickup":
		$Pickup.play()
