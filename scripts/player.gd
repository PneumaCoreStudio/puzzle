class_name Player
extends CharacterBody2D

@onready var animation = $AnimationPlayer

const SPEED = 300.0
var strain : bool
func _ready():
	if strain == true:
		animation.play(strain)


func _physics_process(_delta):
	var direction = Input.get_vector("mv_left", "mv_right", "mv_up", "mv_down")
	velocity = lerp(velocity, direction * SPEED, 0.25)
	velocity.normalized()
	move_and_slide()
