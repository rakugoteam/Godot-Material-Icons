@tool
extends RichTextLabel

@export_multiline
var text_with_icons : String:
	set(value):
		if !is_node_ready():
			return
		
		_text_with_icons = value
		bbcode_enabled = true
		text = MaterialIconsDB.parse_icons(value)

	get:
		return _text_with_icons

var _text_with_icons : String
