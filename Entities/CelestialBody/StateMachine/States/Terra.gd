extends State

export(Array, int) var frames


func enter() -> void:
	owner._change_sprite(frames[randi() % frames.size()])


func collision_resolve(collider_state: String) -> void:
	match(collider_state):
		"Gas":
			# TODO Add Terra Ring
			emit_signal("finished", "gas")
		"Ice":
			emit_signal("finished", "ocean")
		"Iron":
			emit_signal("finished", "lava")
		"Lava":
			emit_signal("finished", "lava")
		"Ocean":
			emit_signal("finished", "earth")
		"Terra":
			pass
		"Star":
			emit_signal("finished", "lava")
		"Comet":
			emit_signal("finished", "ocean")
		"Earth":
			emit_signal("finished", "lava")
		_:
			pass

