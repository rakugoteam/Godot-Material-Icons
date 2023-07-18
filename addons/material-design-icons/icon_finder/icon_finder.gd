@tool
extends Window

@export
@onready var icons_text : RichTextLabel

@export_range(0.1, 1, 0.01)
var fill_scale_x : float = 0.8

@export
@onready var notify_label : Label

@export
@onready var search_line_edit : LineEdit

@export
@onready var size_slider : HSlider

@export
@onready var size_label : Label

func _ready():
	notify_label.hide()
	search_line_edit.text_changed.connect(update_table)
	icons_text.meta_clicked.connect(_on_meta)
	icons_text.set_meta_underline(false)
	icons_text.tooltip_text = "click on icon to copy its name to clipboard"
	close_requested.connect(hide)
	size_slider.value_changed.connect(update_icons_size)
	about_to_popup.connect(update_table)

func _on_visibility_changed():
	if is_visible():
		update_icons_size(size_slider.value)

func update_icons_size(value:int):
	size_label.text = str(value)
	icons_text.set("theme_override_font_sizes/normal_font_size", value)
	update_table(search_line_edit.text)

func update_table(filter := ""):
	var table = "[table={columns}, {inline_align}]"
	table = table.format({
		"columns": int ((size.x * fill_scale_x) / size_slider.value) ,
		"inline_align": INLINE_ALIGNMENT_CENTER
	})

	for key in MaterialIconsDB.icons:
		if filter:
			if not (filter.to_lower() in key):
				continue
		
		var link := "[url={link}]{text}[/url]"
		var text := MaterialIconsDB.get_icon_char(key)
		link = link.format({
			"link": key,
			"text": text
		})

		var cell := "[cell]{link}[/cell]"
		table += cell.format({"link": link})

	table += "[/table]"
	icons_text.parse_bbcode(table)

func _on_meta(link:String):
	DisplayServer.clipboard_set(link)
	notify_label.text = "Copied to Clipboard: " + link
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

