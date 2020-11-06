extends State


func enter() -> void:
	# TODO: Change sprite to gas sprite
	# TODO: Start gas animations
	pass


func update(delta: float) -> void:
	if owner.has_collided:
		print(owner.collider_state)
