extends State


func enter() -> void:
	# TODO: Change sprite to ice sprite
	# TODO: Start ice animations
	pass


func update(delta: float) -> void:
	if owner.has_collided:
		var mass_operator = owner.get_mass() * 0.25
		match(owner.collider_state):
			"Ice":
				owner._increase_mass(mass_operator)
			"Gas":
				# TODO: Add Ice rings
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "gas")
			"Lava":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "ocean")
			"Terra":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "ocean")
			"Ocean":
				owner._increase_mass(mass_operator)
			"Iron":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "ocean")
			"Star":
				owner._decrease_mass(mass_operator)
			"Comet":
				owner._decrease_mass(mass_operator)
			"Earth":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "ocean")
			_:
				owner._decrease_mass(mass_operator)
