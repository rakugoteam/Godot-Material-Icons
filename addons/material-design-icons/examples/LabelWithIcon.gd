@tool
extends RichTextLabel

@export_multiline
var text_with_icons := "Text with Icons: [icon:format-textbox] [icon:alpha]"

func _ready():
	bbcode_enabled = true
	parse_bbcode(MaterialIconsDB.prase_icons(text_with_icons))