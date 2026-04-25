extends Node2D

var words = []
var fallback_words = ["jump", "run", "climb", "fast", "skip", "hop", "dash", "fly", "swim", "kick"]

func _ready():
	print("READY 1")
	words = fallback_words
	print("READY 2")
	spawn_words()
	print("READY 3")

func spawn_words():
	print("SPAWN WORDS CALLED")
	for i in range(words.size()):
		print("SPAWNING:", words[i])
		var word_node = preload("res://scenes/Word_new.tscn").instantiate()
		word_node.set_word(words[i])
		word_node.position = Vector2(randf_range(100, 1000), randf_range(100, 500))
		add_child(word_node)

func _input(event):
	if event is InputEventKey and event.pressed:
		var letter = char(event.unicode)
		if letter.is_valid_identifier():
			for child in get_children():
				if child is Area2D and child.has_method("check_letter"):
					child.check_letter(letter)
