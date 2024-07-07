@tool
extends EditorPlugin

const COMPONENTS_DIR = "res://addons/component/components/"

var inspector_plugin = preload("res://addons/component/inspector_plugin.gd")

func _enter_tree():
	register_components()
	inspector_plugin = inspector_plugin.new()
	add_inspector_plugin(inspector_plugin)

func _exit_tree():
	remove_inspector_plugin(inspector_plugin)

func _save_external_data():
	register_components()
	
func register_components():
	Component.components.clear()
	for dir in DirAccess.get_directories_at(COMPONENTS_DIR):
		var path = str(COMPONENTS_DIR, dir)
		
		if !DirAccess.get_files_at(path).is_empty():
			Component.components[dir] = []
			
		for file_name in DirAccess.get_files_at(path):
			var file = load(str(path, "/", file_name))
			if file is GDScript && file.new() is Component:
				Component.components[dir].append({ "name" : file_name.get_basename().to_pascal_case(), "script" : file })
