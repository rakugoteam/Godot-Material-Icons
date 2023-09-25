![github-top-lang][lang] ![lic] ![lic-font]

# MaterialIcons for Godot

[*Templarian's Material-Design-Icons*](https://github.com/templarian/MaterialDesign) 
is a collection of icons for the [Material Design](https://material.io/) specification.

Now compatible with both Godot 3.4+ (version 1.x) and 4.0+ (version 2.x).

This addon provides the following nodes to use the icons in Godot:
- **MaterialIcon**: A node that displays an icon from the Material Design Icons collection.
- **MaterialButton**: A node that displays an icon from the Material Design Icons collection as a button (without label).

Version 2.0 is rewritten to give you access to **MaterialIconsDB** singleton for easier use of icons anywhere in your project.

It's also adds **IconsFinder** to the Godot's **Tools** menu.
So you can find the icons easily.
![IconsFinder Screen Shot](screenshot_if.png)

## Using it with RichTextLabel
From version 2.0 you can use the icons in RichTextLabel.

*I will backport this feature to version 1.x soon.*

[Example code of using the icons in RichTextLabel here](https://github.com/rakugoteam/Godot-Material-Icons/blob/godot-4/addons/material-design-icons/examples/LabelWithIcons.gd)

## Exporting
For emojis to work in exported projects, you need add `*.json` files to include files settings:
![include files settings](screenshot_export.png)

[lic]: https://img.shields.io/github/license/rakugoteam/Godot-Material-Icons?style=flat-square&label=📃%20License&
[lang]: https://img.shields.io/github/languages/top/rakugoteam/Godot-Material-Icons?style=flat-square
[lic-font]:https://img.shields.io/static/v1.svg?label=📜%20Font%20License&message=Pictogrammers%20Free%20License&color=informational&style=flat-square
