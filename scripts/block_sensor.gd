class_name BlockSensor
extends Node2D

enum SENSOR_COLOR { RED, GREEN, BLUE }
@export var sensor_color : SENSOR_COLOR

@onready var area_2d = $Area2D
@onready var center = $Center

var attached_block : Block = null

func _ready():
	match sensor_color:
		SENSOR_COLOR.RED:
			modulate = Color.RED
		SENSOR_COLOR.GREEN:
			modulate = Color.GREEN
		SENSOR_COLOR.BLUE:
			modulate = Color.BLUE
			
func _physics_process(_delta):
	if !attached_block:
		var bodies = area_2d.get_overlapping_bodies()
		for body in bodies:
			if body is Block && body.key_color == sensor_color:
				if body.global_position != center.global_position:
					body.global_position = body.position.move_toward(center.global_position, 2.0)
					
				else:
					body.modulate = Color.WHITE
					attached_block = body
