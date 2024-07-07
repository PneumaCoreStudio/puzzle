extends EditorProperty

var btn_component : Button = Button.new()
var component_menu : MenuButton = MenuButton.new()

func _init():
	add_child(component_menu)
	add_focusable(component_menu)

	component_menu.get_popup().submenu_popup_delay = 0.125
	component_menu.get_popup().add_separator("Category")
	for category in Component.get_categories():
		var sub_menu = PopupMenu.new()
		var category_text = category.to_pascal_case()
		sub_menu.set_name(category_text)
		
		sub_menu.index_pressed.connect(func(index : int):
			var component = sub_menu.get_item_metadata(index)
			component_menu.text = sub_menu.get_item_text(index)
			get_edited_object().name = component.name
			get_edited_object().set_script(component.script)
			component_menu.text = component.name
			emit_changed(get_edited_property(), component))
			
		for component in Component.get_components(category):
			sub_menu.add_item(component.name)
			sub_menu.set_item_metadata(sub_menu.item_count - 1, component)
		
		component_menu.get_popup().add_child(sub_menu)
		component_menu.get_popup().add_submenu_item(category_text, category_text)

func _ready():
	component_menu.text = get_edited_object()[get_edited_property()].name
