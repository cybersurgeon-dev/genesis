extends Node

func _ready():
	VDP.SET_MODE(50,28)
	get_tree().change_scene_to_file("res://SCENES/CHECKERBOARD_BG/CHECKERBOARD_BG.tscn")
