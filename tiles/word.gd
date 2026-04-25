extends Area2D

var word: String
var typed := ""

func set_word(w: String):
	word = w
	$Label.text = word

func update_display():
	$Label.text = word.substr(typed.length())

func check_letter(letter: String):
	if word.substr(typed.length(), 1) == letter:
		typed += letter
		$Label.text = word.substr(typed.length())
		if typed == word:
			queue_free()

func _ready():
	$Label.add_theme_font_size_override("font_size", 24)
	$Label.modulate = Color(1, 0, 0)
