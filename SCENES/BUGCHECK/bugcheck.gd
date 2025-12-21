extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CORE.sound.create_stream("MUSIC","res://CONTENT/MUSIC/BUGCHECK.mp3","MUSIC")
	VDP["CRAM"][0][1] = Color(0.239, 0.0, 0.042, 1.0)
	VDP["CRAM"][0][2] = Color(0.0, 0.0, 0.0, 1.0)
	VDP["CRAM"][0][3] = Color(0.0, 0.0, 0.0, 1.0)
	VDP["CRAM"][0][4] = Color(1.0, 0.0, 0.0, 1.0)
	VDP.fade_value = 0
	VDP.update_palette()
	#$CheckerboardBg/BG_PARALLAX/CHECKERBOARD.get_tile_set().texture =  load("res://SCENES/BUGCHECK/SKULL.bmp")
	$CONTROL_ROOT/ErrorMsg.text = "ФАТАЛЬНАЯ ОШИБКА\nКОД ОШИБКИ: "+CORE.bugcheck_msg+"\nАРГУМЕНТ: "+CORE.bugcheck_arg

func _process(delta: float) -> void:
	$CheckerboardBg/BG_PARALLAX.autoscroll = Vector2(200*cos(Time.get_ticks_msec()/10000.0),200*sin(Time.get_ticks_msec()/10000.0))
