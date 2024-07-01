extends EditorProperty

var current_index : int
var current_value : Variant

var dropdown : OptionButton = OptionButton.new()

func _init():
	add_child(dropdown)
	add_focusable(dropdown)
	
func _update_property():
	var new_value = dropdown.get_item_metadata(current_index)
	if new_value == current_value:
		return
		
	current_value = new_value
