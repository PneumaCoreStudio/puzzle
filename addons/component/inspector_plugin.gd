extends EditorInspectorPlugin

var dropdown_control = preload("res://addons/component/component_menu.gd")

func _can_handle(object):
	if object is Component:
		return true

func _parse_property(object, type, name, hint_type, hint_string, usage_flags, wide):
	if object is Component && name == "component":
		add_property_editor("component", dropdown_control.new())
		return true
