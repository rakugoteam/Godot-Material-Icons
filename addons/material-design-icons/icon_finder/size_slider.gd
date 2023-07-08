@tool
extends HSlider

@export
@onready var icons_text : RichTextLabel

@export
@onready var value_label : Label

func _ready():
	value_changed.connect(update_icons_size)

func update_icons_size(value:int):
	value_label.text = str(value)
	icons_text.set("theme_override_font_sizes/normal_font_size", value)