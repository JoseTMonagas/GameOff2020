extends StateMachine

signal change_sprite(frame)

export var is_random: bool = true

var collider_state: String

func _ready():
	states_map = {
		"gas": $Gas,
		"ice": $Ice,
		"iron": $Iron,
		"lava": $Lava,
		"ocean": $Ocean,
		"terra": $Terra,
		"star": $Star,
		"comet": $Comet,
		"earth": $Earth
	}
	
	if is_random:
		var states: Array = states_map.keys()
		_change_state(states[randi() % states.size()])


func state_collision(collider_state: String) -> void:
	states_stack[0].collision_resolve(collider_state)


func _change_sprite(frame: int) -> void:
	emit_signal("change_sprite", frame)


func _change_state(state_name: String) -> void:
	if not _active:
		return
	._change_state(state_name)


func _input(event: InputEvent) -> void:
	current_state.handle_input(event)
