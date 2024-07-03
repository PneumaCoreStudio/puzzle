extends EditorProperty

var btn_component : Button = Button.new()
var component_menu : MenuButton = MenuButton.new()

func _init():
	register_components()
	
	add_child(component_menu)
	add_focusable(component_menu)
	
	component_menu.get_popup().submenu_popup_delay = 0.0
	component_menu.get_popup().add_separator("Category")
	for category in Component.get_categories():
		var sub_menu = PopupMenu.new()
		sub_menu.set_name(category)
		sub_menu.index_pressed.connect(func(index : int):
			var component = sub_menu.get_item_metadata(index)
			component_menu.text = sub_menu.get_item_text(index)
			get_edited_object().set_script(component.script)
			get_edited_object().name = component.name)
			
		for component in Component.get_components(category):
			sub_menu.add_item(component.name)
			sub_menu.set_item_metadata(sub_menu.item_count - 1, component)
		
		component_menu.get_popup().add_child(sub_menu)
		component_menu.get_popup().add_submenu_item(category, category)

func _ready():
	component_menu.text = get_edited_object().name

func register_components():
	for file_name in DirAccess.get_files_at(Component.COMPONENTS_PATH):
		var file = load(str(Component.COMPONENTS_PATH, file_name.get_file()))
		if file is GDScript:
			file = file.new()
			if file is Component:
				file._register_component()
