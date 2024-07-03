@tool
class_name Component
extends Node

@export var component : Dictionary = { name : "None" }

const COMPONENTS_PATH = "res://addons/components/components/"

static var components : Array[Dictionary]

static func register_component(name : String, category : String, script : GDScript):
	var component = { "name" : name, "category" : category, "script" : script }
	if !components.has(component):
		components.append(component)
		
static func get_categories():
	var categories = []
	for component in components:
		if !categories.has(component.category):
			categories.append(component.category)
			
	return categories
	
static func get_components(category : String):
	var _components = []
	for component in components:
		if component.category == category:
			_components.append(component)
			
	return _components

func _run():
	pass
