extends Node
class_name SOUND

var streams = {}
var current_track = ""
var target_track = ""
var master_volume:float
var sfx_volume:float
var music_volume:float = 1
var music_fade_value:float
var music_fade_speed:float = 1
var music_bus_index = AudioServer.get_bus_index("MUSIC")
var sfx_bus_index = AudioServer.get_bus_index("SFX")
var stream_loaded:bool = false
var stream_memory:Dictionary = {"SFX":{},"MUSIC":{}}

func create_stream(stream_name:String,path:String,bus:String):
	if not(streams.has(stream_name)):
		streams[stream_name] = AudioStreamPlayer.new()
		streams[stream_name].stream = AudioStreamMP3.new()
		add_child(streams[stream_name])
	var buffer = CORE.load_from_cache(path)
	if buffer != null:
		streams[stream_name].stream.data = buffer
	streams[stream_name].bus = bus
	streams[stream_name].play()
	
func _process(delta: float) -> void:
	if current_track != target_track:
		if music_fade_value > 0:
			music_fade_value = clampf(music_fade_value - music_fade_speed*delta,0,1)
		else:
			current_track = target_track
			create_stream("MUSIC","res://CONTENT/MUSIC/"+target_track+".mp3","MUSIC")
	else:
		music_fade_value = clampf(music_fade_value + music_fade_speed*delta,0,1)
	AudioServer.set_bus_volume_linear(music_bus_index,music_fade_value*music_volume)
