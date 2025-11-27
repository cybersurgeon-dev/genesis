extends Node2D
class_name VDPObject

@export var palette:int 

func _ready() -> void:
	get_parent().material = VDP.PALETTES[palette]
