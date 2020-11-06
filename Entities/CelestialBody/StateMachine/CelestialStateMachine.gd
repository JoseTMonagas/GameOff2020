extends StateMachine

func _ready():
	pass


func _change_state(state_name: String) -> void:
	if not _active:
		return
	._change_state(state_name)


func _input(event: InputEvent) -> void:
	current_state.handle_input(event)
