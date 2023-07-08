@tool
extends EditorPlugin
var icon_search : Window

func _enter_tree():
	add_autoload_singleton("MaterialIconsDB", 
		"res://addons/material-design-icons/icons/icons.gd")
	add_tool_menu_item("Find Material Icon", icon_search.show)
	icon_search.hide()

func _exit_tree():
	remove_child(icon_search)
	remove_autoload_singleton("MaterialIconsDB")