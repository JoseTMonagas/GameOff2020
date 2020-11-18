extends State

export(Array, int) var frames


func enter() -> void:
	owner._change_sprite(frames[randi() % frames.size()])
	

func collision_resolve(collider_state: String) -> void:
	match(collider_state):
			"Gas":
				pass
			"Ice":
				# TODO: Add Ice rings
				pass
			"Iron":
				# TODO: Add Iron rings
				pass
			"Lava":
				emit_signal("finished", "star")
			"Ocean":
				emit_signal("finished", "iron")
			"Terra":
				# TODO: Add Terra rings
				pass
			"Star":
				emit_signal("finished", "star")
			"Comet":
				emit_signal("finished", "gas")
			_:
				pass

