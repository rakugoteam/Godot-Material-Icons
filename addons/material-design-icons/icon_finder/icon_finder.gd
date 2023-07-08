@tool
extends Window

@export
@onready var icons_text : RichTextLabel

@export
var columns : int = 5

@export
@onready var notify_label : Label

@export
@onready var search_line_edit : LineEdit


func _ready():
	notify_label.hide()
	update_table()
	search_line_edit.text_changed.connect(update_table)
	icons_text.meta_clicked.connect(_on_meta)
	icons_text.set_meta_underline(false)
	icons_text.tooltip_text = "click on icon to copy its name to clipboard"
	close_requested.connect(hide)

func update_table(filter := ""):
	var table = "[table={columns}, {inline_align}]"
	table = table.format({
		"columns": columns,
		"inline_align": INLINE_ALIGNMENT_CENTER
	})

	for key in MaterialIconsDB.icons:
		if filter:
			if not fuzzy(filter, key):
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

func fuzzy(filter:String, key:String):
	for letter in filter.to_lower():
		if not (letter in key):
			return false
	return true

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

