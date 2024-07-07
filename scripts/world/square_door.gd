extends StaticBody2D

@onready var animation_player = $AnimationPlayer

var open : bool = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		open_door()

func open_door():
	open = true
	animation_player.play("open")
