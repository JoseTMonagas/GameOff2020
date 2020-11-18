extends State


func enter() -> void:
	owner.linear_velocity = Vector2.ZERO
	owner.linear_damp = 0.0


func handle_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if owner.is_mouse_hovering && event.button_index == BUTTON_LEFT:
			owner.drag_start_position = event.global_position
			emit_signal("finished", "aim")
