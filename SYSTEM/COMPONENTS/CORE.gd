extends Node

func _ready():
	VDP.SET_MODE(50,28)
	get_tree().change_scene_to_file("res://SCENES/VDP_TESTING/CHECKERBOARD_BG.tscn")
	VDP.CRAM[2][1] = VDP.round_color(Color('2c1c20'))
	VDP.CRAM[2][2] = VDP.round_color(Color('100e10'))
	VDP.CRAM[2][3] = VDP.round_color(Color("b26e42ff"))
	VDP.CRAM[2][4] = VDP.round_color(Color('412828'))
	VDP.CRAM[2][5] = VDP.round_color(Color('ffffff'))
	VDP.CRAM[2][6] = VDP.round_color(Color('b74b21'))
	VDP.CRAM[2][7] = VDP.round_color(Color('f98d52'))
	VDP.CRAM[2][8] = VDP.round_color(Color('696682'))
	VDP.CRAM[2][1] = VDP.round_color(Color("2c1c20"))
	VDP.CRAM[2][2] = VDP.round_color(Color("0e0b12ff"))
	VDP.CRAM[2][3] = VDP.round_color(Color("fcb490"))
	VDP.CRAM[2][4] = VDP.round_color(Color('412828'))
	VDP.CRAM[2][5] = VDP.round_color(Color('ffffff'))
	VDP.CRAM[2][6] = VDP.round_color(Color("742c10ff"))
	VDP.CRAM[2][7] = VDP.round_color(Color("8e400bff"))
	VDP.CRAM[2][8] = VDP.round_color(Color("464646ff"))
	VDP.update_palette()

func _process(delta: float) -> void:
	if Input.is_action_pressed("P1_DPAD_RIGHT"):
		VDP.fade_value += delta
		VDP.fade_value = clamp(VDP.fade_value,0,1)
		VDP.update_palette()
	if Input.is_action_pressed("P1_DPAD_LEFT"):
		VDP.fade_value -= delta
		VDP.fade_value = clamp(VDP.fade_value,0,1)
		VDP.update_palette()

	
func _input(_event):
	if Input.is_action_just_pressed("TOGGLE_FULLSCREEN"):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED or DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_MAXIMIZED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
