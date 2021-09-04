tool
extends EditorPlugin
var button = preload("tool_button/ToolButton.tscn")

func _enter_tree():
	button = button.instance()
	add_control_to_container(CONTAINER_TOOLBAR, button)
	var p = button.get_parent()
	p.move_child(button, 1)

	add_custom_type(
		"MaterialIcon", "Label",
		preload("nodes/MaterialIcon.gd"),
		preload("nodes/MaterialIcon.svg")
	)

	add_custom_type(
		"MaterialIconButton", "Button",
		preload("nodes/MaterialButton.gd"),
		preload("nodes/MaterialButton.svg")
	)

func _exit_tree():
	remove_custom_type("MaterialIcon")
	remove_custom_type("MaterialButton")
	remove_control_from_container(CONTAINER_TOOLBAR, button)
