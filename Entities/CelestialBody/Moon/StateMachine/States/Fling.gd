extends State

export var ACCELERATION: float = ProjectSettings.get("physics/2d/default_acceleration")

var deacceleration: int = 1
var impulse_direction: Vector2
var impulse_multiplier: float
var stop_speed: float = ProjectSettings.get("physics/2d/stop_speed")


func enter() -> void:
	owner._change_mode("RIGID")
	var delta_position: Vector2 = owner.drag_start_position - owner.position
	impulse_multiplier = delta_position.length()
	impulse_direction = delta_position.normalized()


func exit() -> void:
	deacceleration = 0


func update(delta: float) -> void:
	var impulse: Vector2 = impulse_direction * (ACCELERATION
												* impulse_multiplier
												- deacceleration)
	owner.apply_central_impulse(impulse * delta)
	
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		deacceleration += ACCELERATION
	
	if impulse.length() < stop_speed:
		emit_signal("finished", "static")
	
	if impulse.length() > 50000:
		impulse.normalized()
		
	Debug.speed = impulse.length()
	
	print("Current Impulse:", impulse.length())
