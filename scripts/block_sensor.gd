class_name BlockSensor
extends Node2D

@onready var area_2d = $Area2D
@onready var center = $Center

func _physics_process(delta):
	var bodies = area_2d.get_overlapping_bodies()
	for body in bodies:
		if body is Block && body.global_position != center.global_position:
			body.global_position = body.position.move_toward(center.global_position, 1.0)
