extends State


func enter() -> void:
	# TODO: Change sprite
	# TODO: Start animations
	pass


func exit() -> void:
	# TODO: Screams
	pass


func update(delta: float) -> void:
	if owner.has_collided:
		var mass_operator = owner.get_mass() * 0.25
		match(owner.collider_state):
			"Gas":
				owner._decrease_mass(mass_operator)
				# TODO Add Terra Ring
				emit_signal("finished", "gas")
			"Ice":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "ocean")
			"Iron":
				owner._increase_mass(mass_operator)
				emit_signal("finished", "lava")
			"Lava":
				owner._increase_mass(mass_operator)
				emit_signal("finished", "lava")
			"Ocean":
				owner._increase_mass(mass_operator)
				emit_signal("finished", "earth")
			"Terra":
				owner._increase_mass(mass_operator)
			"Star":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "lava")
			"Comet":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "ocean")
			"Earth":
				owner._increase_mass(mass_operator)
				emit_signal("finished", "lava")
			_:
				owner._decrease_mass(mass_operator)
