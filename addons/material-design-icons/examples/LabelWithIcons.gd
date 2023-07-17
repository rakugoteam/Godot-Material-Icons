@tool
extends RichTextLabel

@export_multiline
var text_with_icons : String:
	set(value):
		if !Engine.is_editor_hint():
			await ready
		_text_with_icons = value
		bbcode_enabled = true
		text = MaterialIconsDB.prase_icons(value)

	get:
		return _text_with_icons

var _text_with_icons : String
