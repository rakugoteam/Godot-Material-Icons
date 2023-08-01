@tool
extends EditorPlugin

const icons_db := "res://addons/material-design-icons/icons/icons.gd"
const icon_finder_script :=\
	"res://addons/material-design-icons/icon_finder/IconFinder.tscn"
var command_palette := get_editor_interface().get_command_palette()
var editor_interface := get_editor_interface().get_base_control()
var icon_search : Window
var popup_size := Vector2i(775, 400)

func _enter_tree():
	add_autoload_singleton("MaterialIconsDB", icons_db)
	add_tool_menu_item("Find Material Icon", show_icon_finder)
	command_palette.add_command(
		"Find Material Icon", "find_icon", show_icon_finder)

func show_icon_finder():
	if icon_search == null:
		icon_search = load(icon_finder_script).instantiate() as Window
		editor_interface.add_child(icon_search)
		
	icon_search.theme = editor_interface.theme
	icon_search.popup_centered(popup_size)

func _exit_tree():
	remove_tool_menu_item("Find Material Icon")
	command_palette.remove_command("find_icon")
	remove_autoload_singleton("MaterialIconsDB")
	icon_search.queue_free()