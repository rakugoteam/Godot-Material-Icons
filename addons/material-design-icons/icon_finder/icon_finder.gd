@tool
extends Window

@export
@onready var icons_grid : GridContainer

@export
@onready var notify_label : Label

func _ready():
	notify_label.hide()
	for ch in icons_grid.get_children():
		var b := ch as Button
		b.pressed.connect(_on_button.bind(b))

func _on_button(b):
	DisplayServer.clipboard_set(b.name)
	notify_label.text = "Copied to Clipboard: " + b.name
	notify_label.show()

	var t := get_tree().create_tween()
	t.tween_property(
		notify_label, "modulate",
		Color.GREEN, 1
	)
	t.chain().tween_property(
		notify_label, "modulate",
		Color.TRANSPARENT, 1
		)
	await t.finished
	notify_label.hide()

