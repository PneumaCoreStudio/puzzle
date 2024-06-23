class_name BlockSensor
extends Node2D

@onready var area_2d = $Area2D
@onready var collision_shape_2d : CollisionShape2D = $Area2D/CollisionShape2D

func _ready():
	area_2d.body_entered.connect(_on_body_entered)
	
func _on_body_entered(body : Node2D):
	if body is Block:
		print("TURE")
		body.position = lerp(body.position, collision_shape_2d.shape.get_rect().get_center(), 0.125)
