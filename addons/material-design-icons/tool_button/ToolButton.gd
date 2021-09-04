tool
extends Button

export var icon_finder_path : NodePath
export var popup_size := Vector2(450, 400)

onready var icon_finder := get_node(icon_finder_path) as WindowDialog

func _ready():
  connect("pressed", self, "_on_pressed")

func _on_pressed():
  icon_finder.popup_centered(popup_size)  
