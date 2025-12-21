extends Node2D
class_name VDPObject

@export var palette:int 
@export var offset_power:Vector2i
@export var wave_coeff:float = 0
@export var wave_amplitude:float = 1
@export var wave_offset:float = 0
@export var text:bool = false
@export var text_variables:Dictionary[String,int] = {'font_color':0, 'font_outline_color':0}
var mat:ShaderMaterial

func _ready() -> void:
	add_to_group("VDP_PALETTE_"+str(palette))
	update_shader()

func update_shader() -> void: #VDPFX WITH GLOBAL CRAM
	if text == false:
		mat = VDP.PALETTES[palette].duplicate()
		update_offset()
		get_parent().material = mat
	else:
		for variable in text_variables.keys():
			get_parent().set("theme_override_colors/"+variable,VDP.PALETTES[palette].get_shader_parameter("C"+str(text_variables[variable])))

func update_offset():
	mat.set_shader_parameter('offset_power', offset_power)
	mat.set_shader_parameter('wave_coeff', wave_coeff)
	mat.set_shader_parameter('wave_amplitude', wave_amplitude)
	mat.set_shader_parameter('wave_offset', wave_offset)
