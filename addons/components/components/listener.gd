extends Component

@export var actuator : Component

func _register_component():
	super.register_component("Listener", "Device", get_script())
