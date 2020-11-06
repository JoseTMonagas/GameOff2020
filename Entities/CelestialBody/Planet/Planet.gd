extends RigidBody2D

const MASS_TO_SCALE_RATIO: float = 100.0

var has_collided: bool = false
var collider_state: String

var _mass: float = 1.0 setget _set_mass, get_mass

onready var celestialStateMachine: StateMachine = $CelestialStateMachine


func get_state() -> String:
	return celestialStateMachine.current_state.name


func get_mass() -> float:
	return _mass


func resolve_collision(collider_mass: float) -> void:
	_decrease_mass(_mass * 0.5)
	var delta_mass: float = _mass - collider_mass
	if delta_mass > 0:
		_increase_mass(delta_mass * 0.75)
	elif delta_mass < 0:
		_increase_mass(delta_mass * 0.25)
	else:
		_increase_mass(delta_mass * 0.5)


func _set_mass(new_mass: float) -> void:
	_mass = new_mass
	scale = scale * _mass


func _increase_mass(amount: float) -> void:
	self._mass = _mass + amount


func _decrease_mass(amount: float) -> void:
	self._mass = _mass - amount


func _on_body_entered(body: PhysicsBody2D) -> void:
	assert(body.has_method("get_state"))
	body.resolve_collision(_mass)
	has_collided = true
	collider_state = body.get_state()


func _on_body_exited(body: PhysicsBody2D) -> void:
	has_collided = false
	collider_state = ""
