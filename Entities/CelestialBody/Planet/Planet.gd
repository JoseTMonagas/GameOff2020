extends RigidBody2D

var has_collided: bool = false
var collider_state: String

onready var celestialStateMachine: StateMachine = $CelestialStateMachine


func get_state() -> String:
	return celestialStateMachine.current_state.name


func _on_body_entered(body: PhysicsBody2D) -> void:
	assert(body.has_method("get_state"))
	
	
	has_collided = true
	collider_state = body.get_state()


func _on_body_exited(body: PhysicsBody2D) -> void:
	has_collided = false
	collider_state = ""
