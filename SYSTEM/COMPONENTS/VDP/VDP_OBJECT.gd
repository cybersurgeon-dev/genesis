extends Node2D
class_name VDPObject

@export var palette:int 
@export var offset_power:Vector2i

func _process(_delta: float) -> void: #VDPFX WITH GLOBAL CRAM
	var mat:ShaderMaterial = VDP.PALETTES[palette].duplicate()
	mat.set_shader_parameter('offset_power', offset_power)
	get_parent().material = mat
