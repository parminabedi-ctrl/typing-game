extends Area2D

var word: String
var typed := ""

func set_word(w: String):
	word = w
	print("SETTING WORD:", word)   # 👈 add this
	$Label.text = word

func check_letter(letter: String):
	# Check next correct letter
	if word.substr(typed.length(), 1) == letter:
		typed += letter
		
		# Update display (remaining letters)
		$Label.text = word.substr(typed.length())
		
		# Finished word
		if typed == word:
			queue_free()
func _ready():
	$Label.scale = Vector2(10, 10)
	$Label.modulate = Color(1, 0, 0)
