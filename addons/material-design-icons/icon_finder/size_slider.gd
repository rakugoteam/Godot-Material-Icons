@tool
extends HSlider

@export
@onready var grid : GridContainer

@export
@onready var value_label : Label

func _ready():
	value_changed.connect(update_icons_size)

func update_icons_size(value:int):
	value_label.text = str(value)
	for c in grid.get_children():
		var b := c as MaterialButton
		b.icon_size = value
