extends EditorInspectorPlugin

var dropdown = preload("res://addons/components/dropdown.gd")

func _can_handle(object):
	if object is Component:
		return true

func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if object is Component:
		if name == "category":
			add_property_editor("category", dropdown.new())
			return true
			
		if name == "component":
			add_property_editor("component", dropdown.new())
			return true
			
	return false
