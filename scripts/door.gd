extends StaticBody2D

@onready var animation = $AnimationPlayer
var door_opened : bool = false
var tween : Tween

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if !tween:
			tween = create_tween()
			
		if !door_opened:
			tween.tween_property(self, "global_position:x", global_position.x + 16, 1)
			await tween.finished
			tween = null
			door_opened = true
		else:
			tween.tween_property(self, "global_position:x", global_position.x - 16, 1)
			await tween.finished
			tween = null
			door_opened = false
