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
				emit_signal("finished", "star")
			"Ice":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "ocean")
			"Iron":
				owner._increase_mass(mass_operator)
			"Lava":
				owner._increase_mass(mass_operator)
			"Ocean":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "gas")
			"Terra":
				owner._increase_mass(mass_operator)
				emit_signal("finished", "lava")
			"Star":
				owner._decrease_masss(mass_operator)
			"Comet":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "ocean")
			"Earth":
				owner._decrease_mass(mass_operator)
			_:
				owner._decrease_mass(mass_operator)
