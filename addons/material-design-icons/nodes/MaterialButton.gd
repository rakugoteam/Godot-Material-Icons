@tool
@icon("res://addons/material-design-icons/nodes/MaterialButton.svg")
extends Button
class_name MaterialButton

@export var icon_name := "image-outline":
	set(value):
		_set_icon_name(value)

@export_range(16, 128, 1)
var icon_size := 16:
	set(value):
		_set_icon_size(value)

var font: FontFile

func _ready():
	clip_text = false
	font = MaterialIconsDB.font
	set("theme_override_fonts/font", font)

func _set_icon_name(value: String):
	text = MaterialIconsDB.get_icon_char(value)

func _set_icon_size(value: int):
	set("theme_override_font_sizes/font_size", value)
