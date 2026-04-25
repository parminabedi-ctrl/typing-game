extends Node2D

@onready var http = $WordapiRequester
var words = []

func _ready():
	print("READY")
	http.request("https://random-word-api.herokuapp.com/word?number=5")

func _on_WordapiRequester_request_completed(result, response_code, headers, body):
	if response_code != 200:
		print("API FAILED")
		return

	words = JSON.parse_string(body.get_string_from_utf8())
	print(words)
