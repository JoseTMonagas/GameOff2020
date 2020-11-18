extends Label

var start_position: Vector2


func _ready() -> void:
	if !OS.is_debug_build():
		visible = false
	start_position = rect_position
	


func _physics_process(delta: float) -> void:
	rect_position = $"../Sprite".position + start_position


func _on_state_changed(current_state: Node) -> void:
	text = current_state.name
