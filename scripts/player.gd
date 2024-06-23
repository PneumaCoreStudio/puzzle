extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	var direction = Input.get_vector("mv_left", "mv_right", "mv_up", "mv_down")
	
	velocity = lerp(velocity, direction * SPEED, 0.25)
	velocity.normalized()

	move_and_slide()
