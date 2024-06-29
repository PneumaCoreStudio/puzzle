extends StaticBody2D

var open : bool = false
var doorTween : Tween
@onready var door_l = $door_L
@onready var door_r = $door_R
@onready var sprite_l = $door_L/Sprite2D
@onready var sprite_r = $door_R/Sprite2D
var open_time : float = .1
var open_width : int = 30


func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if !doorTween:
			doorTween = create_tween()

		if !open:
			#doorTween.tween_property(sprite_l, "modulate", Color("GREEN"), .02)
			#doorTween.parallel().tween_property(sprite_r, "modulate", Color("GREEN"), .02)
			doorTween.parallel().tween_property(door_l, "global_position:x", global_position.x - open_width, open_time)
			doorTween.parallel().tween_property(door_r, "global_position:x", global_position.x + open_width, open_time)
			await doorTween.finished
			doorTween = null
			open = true
		elif open:
			#doorTween.tween_property(sprite_l, "modulate", Color("RED"), .02)
			#doorTween.parallel().tween_property(sprite_r, "modulate", Color("RED"), .02)
			doorTween.parallel().tween_property(door_l, "global_position:x", global_position.x + open_width, open_time)
			doorTween.parallel().tween_property(door_r, "global_position:x", global_position.x - open_width , open_time)
			await doorTween.finished
			doorTween = null
			open = false
		else:
			return
