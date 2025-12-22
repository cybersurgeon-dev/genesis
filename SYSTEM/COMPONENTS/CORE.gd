extends Node

var scene:Node
var scene_transition:bool = false
var scene_path:String
var sound
var cache:Dictionary = {}
var debug:bool = true
var bugcheck_msg
var bugcheck_arg

func _ready():
	VDP.SET_MODE(50,28)
	sound = SOUND.new()
	get_tree().get_root().add_child.call_deferred(sound)
	switch_scene("res://SCENES/MAINMENU/MAINMENU.tscn")
	VDP.update_palette()

func switch_scene(path:String):
	if scene != null:
		scene.queue_free()
	if FileAccess.file_exists(path):
		scene = load(path).instantiate()
	else:
		bugcheck("SCENE_FILE_NOT_EXIST",path)
	add_child(scene)

func trans_scene(path:String):
	scene_transition = true
	VDP.fade_dimming = true
	scene_path = path

func _process(_delta: float) -> void:
	if scene_transition:
		if VDP.fade_value == 0:
			scene_transition=false
			switch_scene(scene_path)
			VDP.fade_dimming=false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("P1_A"):
		CORE.sound.target_track = '00'

func load_from_cache(path):
	while not(cache.has(path)):
		dbg("WARN", "CACHE MISSING, JUST-IN-TIME LOADING... "+path)
		if load_to_cache(path):
			cache[path] = null
			bugcheck("CANNOT_CACHE_FILE",path)
	return cache[path]

func load_to_cache(path):
	var file = FileAccess.open(path,FileAccess.READ)
	if file != null:
		cache[path] = file.get_buffer(file.get_length())
		file.close()
	else:
		return true

func remove_from_cache(path):
	cache.erase(path)

func dbg(type:String, msg:String):
	if debug:
		print("["+type+"]: " + msg)

func bugcheck(msg,arg):
	bugcheck_msg = msg
	bugcheck_arg = arg
	print("BUG")
	switch_scene("res://SCENES/BUGCHECK/BUGCHECK.tscn")
