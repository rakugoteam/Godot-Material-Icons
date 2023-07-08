@tool
extends EditorScript

var icons := MaterialIconsDB.icons
var icons_size := 24

func _run():
	var grid := GridContainer.new()
	grid.name = "IconsGrid"
	for k in icons.keys():
		var b := MaterialButton.new()
		b.name = k
		b.icon_name = k
		b.icon_size = icons_size
		grid.add_child(b)
		b.owner = grid

	var scene = PackedScene.new()
	var result = scene.pack(grid)

	if result == OK:
		var path := "res://addons/material-design-icons/icon_finder/IconsGrid.tscn"
		var error = ResourceSaver.save(scene, path)
		if error != OK:
				push_error("An error occurred while saving the scene to disk.")
				return
		print("IconsGrid saved")



