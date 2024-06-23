extends StaticBody2D

@onready var animation = $AnimationPlayer

var open : bool = false

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		animation.play("open")
