extends CharacterBody2D



const SPEED = 1500.0
const JUMP_VELOCITY = -1200.0


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_key_pressed(KEY_LEFT):
		print("LEFT KEY DIRECTLY DETECTED")
		velocity.x = -SPEED
	elif Input.is_key_pressed(KEY_RIGHT):
		print("RIGHT KEY DIRECTLY DETECTED")  
		velocity.x = SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()
