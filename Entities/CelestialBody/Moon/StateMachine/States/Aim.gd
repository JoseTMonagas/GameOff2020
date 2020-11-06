extends State

export var MAX_AIM_RADIUS: float = 200.0

var mouse_position: Vector2


func handle_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_position = event.global_position
	
	if event is InputEventMouseButton && !event.is_pressed():
		emit_signal("finished", "fling")
	
	

func update(delta: float) -> void:
	if (mouse_position.length() <= MAX_AIM_RADIUS):
		owner.position = mouse_position
