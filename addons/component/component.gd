@tool
class_name Component
extends Node

const BASE_SCRIPT = preload("res://addons/component/component.gd")

@export var component : Dictionary = { "name" : "Base", "script" : super.get_script() }

static var components : Dictionary = {}

func _ready():
	for connection in property_list_changed.get_connections():
		property_list_changed.disconnect(connection.callable)
		
	print(property_list_changed.get_connections())

static func get_categories() -> PackedStringArray:
	return components.keys()

static func get_components(category : String) -> Array:
	return components[category]
	
func _run():
	pass
	#
#func _property_can_revert(property):
	#if property == "component" && get_script() != BASE_SCRIPT:
		#return true
	#
#func _property_get_revert(property):
	#set_script(BASE_SCRIPT)
	#return { "name" : "Base", "script" : super.get_script() }
