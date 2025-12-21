extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	VDP.load_palette("res://SCENES/VDP_TESTING/checkerboard.hex",0)
