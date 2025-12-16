extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Circle/VDPObject.wave_offset += delta*5
	$Circle/VDPObject.update_offset()
	$Character/VDPObject.wave_offset += delta*3
	$Character/VDPObject.update_offset()
