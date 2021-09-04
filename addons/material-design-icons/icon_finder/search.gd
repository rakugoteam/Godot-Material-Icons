tool
extends LineEdit

export var grid_node_path : NodePath
onready var grid := get_node(grid_node_path) as GridContainer

func _ready():
	connect("text_changed", self, "_on_text_changed")

func _on_text_changed(text):
	if text != "":
		for b in grid.get_children():
			if text in b.name:
				b.show()
			else:
				b.hide()
	else:
		for b in grid.get_children():
			b.show()
