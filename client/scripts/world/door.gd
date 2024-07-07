extends StaticBody2D

var open : bool = false
var doorTween : Tween
@onready var door_l = $door_L
@onready var door_r = $door_R
@onready var sprite_l = $door_L/Sprite2D
@onready var sprite_r = $door_R/Sprite2D
var open_time : float = 0.5
var open_width : int = 15

func _physics_process(delta):
	if doorTween && doorTween.is_running():
		await doorTween.finished
		doorTween = null
		return
	
	if Input.is_action_just_pressed("ui_accept"):
		if !doorTween:
			doorTween = get_tree().create_tween()
			doorTween.set_parallel()
		
		if !open:
			doorTween.tween_property(sprite_l, "modulate", Color.GREEN, open_time * 2)
			doorTween.tween_property(sprite_r, "modulate", Color.GREEN, open_time * 2)
			doorTween.tween_property(door_l, "global_position:x", global_position.x - open_width, open_time).as_relative()
			doorTween.tween_property(door_r, "global_position:x", global_position.x + open_width, open_time).as_relative()
			open = true
			
		elif open:
			doorTween.tween_property(sprite_l, "modulate", Color.RED, open_time * 2)
			doorTween.tween_property(sprite_r, "modulate", Color.RED, open_time * 2)
			doorTween.tween_property(door_l, "global_position:x", global_position.x + open_width, open_time).as_relative()
			doorTween.tween_property(door_r, "global_position:x", global_position.x - open_width, open_time).as_relative()
			open = false
			
		else:
			return
