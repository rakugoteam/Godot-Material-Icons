@tool
@icon("res://addons/material-design-icons/nodes/MaterialButton.svg")
extends Button

## Simple Button with Material Icon
## @tutorial: "rakugoteam.github.io/material-icons-docs/2.1/MaterialButton/"
## @tutorial(Icon Finder): "rakugoteam.github.io/material-icons-docs/2.1/HowToUse/"
class_name MaterialButton

## Name of Material Icon to display
@export var icon_name := "image-outline":
	set(value):
		icon_name = value
		text = MaterialIconsDB.get_icon_char(value)
	
	get: return icon_name

## Size of the icon in range 16-128
@export_range(16, 128, 1)
var icon_size := 16:
	set(value):
		icon_size = value
		set("theme_override_font_sizes/font_size",value)
	
	get: return icon_size

func _ready():
	clip_text = false
	var font := MaterialIconsDB.font
	text = MaterialIconsDB.get_icon_char(icon_name)
	set("theme_override_fonts/font",font)
	set("theme_override_font_sizes/font_size",icon_size)
