@tool
@icon("res://addons/material-design-icons/nodes/MaterialIcon.svg")

extends Label
class_name MaterialIcon

var _icon_name := "image-outline"
var _icon_size := 16

@export var icon_name : String:
	set(value):
		_set_icon_name(value)
	get:
		return _icon_name

@export_range(16, 128, 1)
var icon_size : int:
	set(value):
		_set_icon_size(value)
	get:
		return _icon_size

func _ready():
	clip_text = false
	var font := MaterialIconsDB.font
	set("theme_override_fonts/font", font)

func _set_icon_name(value: String):
	_icon_name = value
	text = MaterialIconsDB.get_icon_char(value)

func _set_icon_size(value: int):
	_icon_size = value
	set("theme_override_font_sizes/font_size", value)