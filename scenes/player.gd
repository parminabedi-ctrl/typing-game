extends CharacterBody2D

func _physics_process(delta):
	velocity = Vector2.ZERO
	velocity.y = -400
	move_and_slide()
	print(global_position)
