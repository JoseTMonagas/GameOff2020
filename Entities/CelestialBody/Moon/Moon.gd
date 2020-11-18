extends "res://Entities/CelestialBody/Planet/Planet.gd"

var is_mouse_hovering: bool = false
var drag_start_position: Vector2

onready var camera: Camera2D = $Camera2D


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		event as InputEventMouseButton
		if event.pressed:
			match event.button_index:
				BUTTON_WHEEL_UP:
					_camera_zoom()
				BUTTON_WHEEL_DOWN:
					_camera_zoom(-1)


func _physics_process(delta: float) -> void:
	var collisions: Array = get_colliding_bodies()
	
	if collisions.size() > 0:
		linear_damp += 1


func _set_mass(new_mass: float) -> void:
	Debug.mass = new_mass
	._set_mass(new_mass)


func _camera_zoom(_zoom: int = 1) -> void:
	var zoom: float = 0.25 * _zoom
	var limit: float = 2
	
	var zoom_x: float = clamp(camera.zoom.x + zoom, -limit, limit)
	var zoom_y: float = clamp(camera.zoom.y + zoom, -limit, limit)
	
	camera.zoom.x = zoom_x
	camera.zoom.y = zoom_y


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

