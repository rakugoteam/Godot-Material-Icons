![github-top-lang][lang] ![lic] ![lic-font]

# MaterialIcons for Godot

[*Templarian's Material-Design-Icons*](https://github.com/templarian/MaterialDesign) is a collection of icons for the [Material Design](https://material.io/) specification.

This addon provides the following nodes to use the icons in Godot:
- **MaterialIcon**: A node that displays an icon from the Material Design Icons collection.
- **MaterialButton**: A node that displays an icon from the Material Design Icons collection as a button (without label).

It's also adds **IconsFinder** to the Godot's **Tools** menu.
So you can find the icons easily.

![IconsFinder Screen Shot](screenshot_if.png)

## Exporting
For emojis to work in exported projects, you need add `*.json` files to include files settings:
![include files settings](screenshot_export.png)

## Install using gd-plug
To install it with [gd-plug](https://github.com/imjp94/gd-plug) add in your `plug.gd` script:
```gdscript
extends "res://addons/gd-plug/plug.gd"

func _plugging():
	# your other plugins/addons install instructions
	# ...
	plug("rakugoteam/Godot-Material-Icons", {"include": ["addons", ".import/"]})
```

[lic]: https://img.shields.io/github/license/rakugoteam/Godot-Material-Icons?style=flat-square&label=📃%20License&
[lang]: https://img.shields.io/github/languages/top/rakugoteam/Godot-Material-Icons?style=flat-square
[lic-font]:https://img.shields.io/static/v1.svg?label=📜%20Font%20License&message=Pictogrammers%20Free%20License&color=informational&style=flat-square
