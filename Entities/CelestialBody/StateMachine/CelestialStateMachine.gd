extends StateMachine

func _ready():
	for children in get_children():
		children.set_owner(get_parent())
	
	states_map = {
		"gas": $Gas
	}


func _change_state(state_name: String) -> void:
	if not _active:
		return
	._change_state(state_name)


func _input(event: InputEvent) -> void:
	current_state.handle_input(event)
