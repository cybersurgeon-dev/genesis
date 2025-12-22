@tool
extends Container
class_name Layer

@export var fullscreen:bool
@export var offset:Vector2 = Vector2(0,0)
@export var initial_position:Vector2 = Vector2(0,0)

func _set(property: StringName, value:Variant) -> bool:
	if property == "position":
		initial_position = value
	return false
	
func _process(delta) -> void:
	if fullscreen == true:
		if Engine.is_editor_hint():
			set_size(Vector2(ProjectSettings.get_setting("display/window/size/viewport_width"),ProjectSettings.get_setting("display/window/size/viewport_height")))
			pass
		else:
			size = VDP.resolution
	position =  initial_position  + offset
	if not Engine.is_editor_hint():
		offset = offset+(Vector2(0,0) - offset)*2*delta

func _notification(what):
	if what == NOTIFICATION_SORT_CHILDREN:
		# Must re-sort the children
		for c in get_children():
			# Fit to own size
			fit_child_in_rect(c, Rect2(Vector2(), size))

func set_some_setting():
	# Some setting changed, ask for children re-sort.
	queue_sort()
