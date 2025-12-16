extends Node

#SEGA GENESIS SPECIFICATIONS
const tile_size = 8
const palette_size = 16
const palette_count = 4
const color_ramp = [0,52,87,116,144,172,206,255]
var fade_value:float = 0
var fade_blue:bool = true
var hardware_colors = true
var CRAM = []
var PALETTES = []

func _ready() -> void:
	generate_palette()
	var clear_color = CRAM[0][0]
	clear_color.a = 1 # CLEAR COLOR IS NOT TRANSPARENT
	RenderingServer.set_default_clear_color(clear_color)
	update_palette()

func round_color(color: Color):
	if hardware_colors == true: # PICKING THE CLOSEST COLOR TO THE VDP'S COLORS
		for channel in 3:
			var closest_color:float = color_ramp[0]/255.0 # FIXED COLOR RAMP ALGORITHM
			for i in color_ramp:
				if abs(color[channel]*255 - closest_color*255) > abs(color[channel]*255 - i):
					closest_color = i/255.0
			color[channel] = closest_color
	return color

func generate_palette():
	CRAM = []
	PALETTES = []
	# REGISTER PALETTES IN CRAM
	for palette in palette_count:
		CRAM.append([])
		PALETTES.append(ShaderMaterial.new()) # CREATE SHADER MATERIALS
	# FILL PALETTES WITH EMPTY COLORS
	for palette in len(CRAM):
		for color in palette_size:
			CRAM[palette].append(round_color(Color.from_rgba8(randi_range(0,255),randi_range(0,255),randi_range(0,255)))) # GENERATE RANDOM COLORS
		CRAM[palette][0].a = 0 # FIRST COLOR IN PALETTE IS ALWAYS TRANSPARENT, SEE THE SPECS 
	for material:ShaderMaterial in PALETTES:
		material.shader = load("res://SYSTEM/COMPONENTS/VDP/VDP_OBJECT.gdshader")

func update_palette():
	for palette in len(CRAM):
		var material:ShaderMaterial = PALETTES[palette]
		for color in len(CRAM[palette]):
			var color_value = CRAM[palette][color]
			if fade_blue:
				material.set_shader_parameter("C"+str(color),round_color(Color(color_value.r*min(1,fade_value), color_value.g*fade_value, color_value.b*min(1,fade_value*4)))) # SYNC GODOT MATERIAL WITH CRAM + SONICFADE
			else:
				material.set_shader_parameter("C"+str(color),round_color(Color(color_value.r*min(1,fade_value), color_value.g*min(1,fade_value), color_value.b*min(1,fade_value)))) # SYNC GODOT MATERIAL WITH CRAM + NORMALFADE
		material.set_shader_parameter("C0",Color(0,0,0,0))
		get_tree().call_group("VDP_PALETTE_"+str(palette),"update_shader")

func SET_MODE(H,V):
	var resolution = Vector2(tile_size * H, tile_size * V) # SETTING THE HXX RESOLUTION (ex. H40)
	get_tree().root.content_scale_size = resolution
	DisplayServer.window_set_min_size(resolution)
