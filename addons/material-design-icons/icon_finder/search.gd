@tool
extends LineEdit

@export
@onready var grid: GridContainer

func _ready():
	text_changed.connect(_on_text_changed)

func _on_text_changed(new_text):
	if new_text.is_empty():
		for b in grid.get_children():
			b.show()
		return
	
	for b in grid.get_children():
		b.visible = new_text in b.name
