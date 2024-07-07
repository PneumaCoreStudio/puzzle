@tool
class_name Component
extends Node

@export var component : Dictionary = { "name" : "Base", "script" : get_script() }

static var components : Dictionary = {}

static func get_categories() -> PackedStringArray:
	return components.keys()

static func get_components(category : String) -> Array:
	return components[category]

func _run():
	pass
