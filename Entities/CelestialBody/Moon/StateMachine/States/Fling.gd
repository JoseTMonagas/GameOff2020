extends State

export var ACCELERATION: float = 120.0

var impulse_direction: Vector2
var impulse_multiplier: float


func enter() -> void:
	owner._change_mode("RIGID")
	var delta_position: Vector2 = owner.drag_start_position - owner.position
	impulse_multiplier = delta_position.length()
	impulse_direction = delta_position.normalized()


func update(delta: float) -> void:
	var impulse: Vector2 = impulse_direction * ACCELERATION * impulse_multiplier
	owner.apply_central_impulse(impulse * delta)
