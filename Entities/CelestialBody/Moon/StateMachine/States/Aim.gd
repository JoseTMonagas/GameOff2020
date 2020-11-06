extends State

export var MAX_AIM_RADIUS: float = 200.0

var mouse_position: Vector2

func enter() -> void:
	mouse_position = owner.drag_start_position


func handle_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_position = event.global_position
	
	if event is InputEventMouseButton && !event.is_pressed():
		emit_signal("finished", "fling")
	
	

func update(delta: float) -> void:
	var length = (owner.drag_start_position - mouse_position).length()
	if length <= MAX_AIM_RADIUS:
		owner.global_position = mouse_position

