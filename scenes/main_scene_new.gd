extends Node2D

@onready var http = $WordapiRequester
var words = []

func _ready():
	print("READY")

	http.request_completed.connect(_on_request_done)
	http.request("https://random-word-api.herokuapp.com/word?number=5")


func _on_request_done(result, response_code, headers, body):
	print("REQUEST DONE")

	if response_code != 200:
		print("FAILED")
		return

	words = JSON.parse_string(body.get_string_from_utf8())
	print(words)

	spawn_words()


func spawn_words():
	print("SPAWN WORDS CALLED")

	for i in range(words.size()):
		print("SPAWNING:", words[i])

		var word_node = preload("res://scenes/Word.tscn").instantiate()
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
