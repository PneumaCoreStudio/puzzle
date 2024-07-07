class_name BlockSensor
extends Node2D

enum SENSOR_COLOR { RED, GREEN, BLUE }
@export var sensor_color : SENSOR_COLOR

@onready var center = $Center
@onready var area_2d = $Area2D

var block : Block = null

func _ready():
	match sensor_color:
		SENSOR_COLOR.RED:
			modulate = Color.RED
		SENSOR_COLOR.GREEN:
			modulate = Color.GREEN
		SENSOR_COLOR.BLUE:
			modulate = Color.BLUE
			
func _physics_process(_delta):
	if !block:
		lock_block()
		
	else:
		center_block(block)
		
func lock_block():
	var bodies = area_2d.get_overlapping_bodies()
	var center = center.global_position
	for body in bodies:
		if body is Block && body.key_color == sensor_color:
			if body.global_position.distance_to(center) <= 1 && abs(body.linear_velocity) <= Vector2(10, 10):
				block = body
				block.freeze = true
				block.modulate = Color.WHITE
				
			else:
				center_block(body)

func center_block(block : Block):
	var center = center.global_position
	if block.global_position != center:
		block.global_position = block.position.move_toward(center, 0.5)
