class_name Block
extends RigidBody2D

enum KEY_COLOR { RED, GREEN, BLUE }
@export var key_color : KEY_COLOR

func _ready():
	match key_color:
		KEY_COLOR.RED:
			modulate = Color.DARK_RED
		KEY_COLOR.GREEN:
			modulate = Color.DARK_GREEN
		KEY_COLOR.BLUE:
			modulate = Color.DARK_BLUE
