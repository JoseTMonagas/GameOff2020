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
				owner._increase_mass(mass_operator)
			"Ice":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "water")
			"Iron":
				owner._increase_mass(mass_operator)
			"Lava":
				owner._increase_mass(mass_operator)
			"Ocean":
				owner._decrease_mass(mass_operator)
				emit_signal("finished", "terra")
			"Terra":
				owner._increase_mass(mass_operator)
			"Star":
				owner._increase_mass(mass_operator)
			"Comet":
				owner._increase_mass(mass_operator)
			"Earth":
				owner._increase_mass(mass_operator)
			_:
				owner._decrease_mass(mass_operator)
