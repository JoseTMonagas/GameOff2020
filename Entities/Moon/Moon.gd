extends RigidBody2D

var is_mouse_hovering: bool = false
var drag_start_position: Vector2


func _change_mode(new_mode: String) -> void:
	match(new_mode):
		"RIGID":
			mode = RigidBody2D.MODE_RIGID
		"STATIC":
			mode = RigidBody2D.MODE_STATIC
		_:
			mode = RigidBody2D.MODE_RIGID


func _on_Moon_mouse_entered():
	is_mouse_hovering = true


func _on_Moon_mouse_exited():
	is_mouse_hovering = false
