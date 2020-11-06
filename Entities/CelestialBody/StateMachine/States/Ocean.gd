extends State


func enter() -> void:
	# TODO: Change sprite
	# TODO: Start animations
	pass


func update(delta: float) -> void:
	if owner.has_collided:
		var mass_operator = owner.get_mass() * 0.25
		match(owner.collider_state):
			"Gas":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "ice")
			"Ice":
				owner._increase_mass(mass_operator)
				emit_signal("finished", "ice")
			"Iron":
				owner._increase_mass(mass_operator)
				emit_signal("finished", "terra")
			"Lava":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "gas")
			"Ocean":
				owner._increase_mass(mass_operator)
			"Terra":
				owner._increase_mass(mass_operator)
				emit_signal("finished", "earth")
			"Star":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "gas")
			"Comet":
				owner._increase_mass(mass_operator)
				emit_signal("finished", "ice")
			"Earth":
				owner._increase_mass(mass_operator)
			_:
				owner._decrease_mass(mass_operator)
