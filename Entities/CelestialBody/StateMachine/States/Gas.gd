extends State


func enter() -> void:
	# TODO: Change sprite to gas sprite
	# TODO: Start gas animations
	pass


func update(delta: float) -> void:
	if owner.has_collided:
		var mass_operator = owner.get_mass() * 0.25
		match(owner.collider_state):
			"Gas":
				owner._increase_mass(mass_operator)
			"Ice":
				owner._decrease_mass(mass_operator)
				# TODO: Add Ice rings
			"Iron":
				owner._decrease_mass(mass_operator)
				# TODO: Add Iron rings
			"Lava":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "star")
			"Ocean":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "iron")
			"Terra":
				owner._decrease_mass(mass_operator)
				# TODO: Add Terra rings
			"Star":
				emit_signal("finished", "star")
			"Comet":
				emit_signal("finished", "gas")
			_:
				owner._decrease_mass(mass_operator)
