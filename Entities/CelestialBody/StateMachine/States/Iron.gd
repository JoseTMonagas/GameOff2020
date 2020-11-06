extends State


func enter() -> void:
	# TODO: Change sprite to iron sprite
	# TODO: Start iron animations
	pass


func update(delta: float) -> void:
	if owner.has_collided:
		var mass_operator = owner.get_mass() * 0.25
		match(owner.collider_state):
			"Gas":
				owner._decresase_mass(mass_operator)
				# TODO Add Iron rings
				emit_signal("finished", "gas")
			"Ice":
				owner._decresase_mass(mass_operator)
				emit_signal("finished", "ocean")
			"Iron":
				owner._incresase_mass(mass_operator)
			"Lava":
				owner._incresase_mass(mass_operator)
				emit_signal("finished", "lava")
			"Ocean":
				owner._incresase_mass(mass_operator)
				emit_signal("finished", "terra")
			"Terra":
				owner._incresase_mass(mass_operator)
				emit_signal("finished", "lava")
			"Star":
				owner._decresase_masss(mass_operator)
				emit_signal("finished", "lava")
			"Comet":
				owner._decresase_mass(mass_operator)
				emit_signal("finished", "ocean")
			"Earth":
				owner._decresase_mass(mass_operator)
				emit_signal("finished", "lava")
			_:
				owner._decrease_mass(mass_operator)
