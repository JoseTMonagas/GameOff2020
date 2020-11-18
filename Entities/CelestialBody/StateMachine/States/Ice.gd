extends State

export(Array, int) var frames


func enter() -> void:
	owner._change_sprite(frames[randi() % frames.size()])


func collision_resolve(collider_state: String) -> void:
	match(collider_state):
		"Ice":
			pass
		"Gas":
			# TODO: Add Ice rings
			emit_signal("finished", "gas")
		"Lava":
			emit_signal("finished", "ocean")
		"Terra":
			emit_signal("finished", "ocean")
		"Ocean":
			pass
		"Iron":
			emit_signal("finished", "ocean")
		"Star":
			emit_signal("finished", "comet")
		"Comet":
			pass
		"Earth":
			emit_signal("finished", "ocean")
		_:
			pass
