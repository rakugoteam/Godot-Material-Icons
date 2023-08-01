@tool
extends Node

const json_path := "res://addons/material-design-icons/icons/icons.json"
const font_path := "res://addons/material-design-icons/fonts/material_design_icons.ttf"
@onready var font := preload(font_path) as FontFile
var icons := {}

func _ready():
	var content = get_file_content(json_path)
	var json := JSON.new()

	if json.parse(content) == OK:
		init_icons_dictionaries(json.data)

func get_file_content(path:String) -> String:
	var file := FileAccess.open(path, FileAccess.READ)
	var content := ""
	
	if file.get_error() == OK:
		content = file.get_as_text()
		file.close()

	return content

func init_icons_dictionaries(dict:Dictionary):
	icons = {}
	for icon in dict:
		var hex: String = dict[icon].to_lower()
		var value: int = ("0x"+ hex).hex_to_int()
		icons[icon] = value

func get_icon_code(id:String) -> int:
	if id in icons:
		return icons[id]
		
	push_warning("Icon '%s' not found." % id)
	return 0

func get_icon_name(char:int) -> String:
	for icon in icons:
		if icons[icon] == char:
			return icon

	push_warning("Icon with char '%s' not found." % char)
	return ""

func get_icon_char(id:String) -> String:
	return char(get_icon_code(id))

func prase_icons(text:String) -> String:
	# take replace [icon] to [font=MaterialIcons]icon_char[/font]
	var regex = RegEx.new()
	regex.compile("\\[icon:(.*?)\\]")
	var x = regex.search(text)
	while x != null:
		var icon = x.get_string(1)
		var char = get_icon_char(icon)
		var r = "[font={font}]{char}[/font]"
		r = r.format({"font":font.resource_path, "char": char})
		text = text.replace(x.get_string(), r)
		x = regex.search(text, x.get_end())
	
	return text
