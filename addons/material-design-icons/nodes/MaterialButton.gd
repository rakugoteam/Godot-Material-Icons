@tool
@icon("res://addons/material-design-icons/nodes/MaterialButton.svg")
extends Button
class_name MaterialButton

var _icon_name : String
var _icon_size : int

@export var icon_name := "image-outline":
	set(value):
		_set_icon_name(value)
	get:
		return _icon_name

@export_range(16, 128, 1)
var icon_size := 16:
	set(value):
		_set_icon_size(value)
	get:
		return _icon_size

func _ready():
	clip_text = false
	var font := MaterialIconsDB.font
	set("theme_override_fonts/font", font)

func _set_icon_name(value: String):
	if !Engine.is_editor_hint():
		await ready
	_icon_name = value
	text = MaterialIconsDB.get_icon_char(value)

func _set_icon_size(value: int):
	if !Engine.is_editor_hint():
		await ready
	_icon_size = value
	set("theme_override_font_sizes/font_size", value)
