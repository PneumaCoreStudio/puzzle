class_name Player
extends CharacterBody2D

@export_range(1, 10, 0.5) var pushing_force : float = 1

@onready var animation = $AnimationPlayer

const SPEED = 5.0
var strain : bool

func _ready():
	pushing_force = remap(pushing_force, 1, 10, 1000, 10_000)
	if strain == true:
		animation.play(strain)

func _physics_process(_delta):
	var direction = Input.get_vector("mv_left", "mv_right", "mv_up", "mv_down").normalized()
	velocity = lerp(velocity, direction * SPEED, 0.25)

	var collision = move_and_collide(velocity)
	if collision:
		var collider = collision.get_collider()
		if collider is Block:
			collider.apply_force(-collision.get_normal() * abs(velocity) * pushing_force)
