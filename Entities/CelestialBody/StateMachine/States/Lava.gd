extends State


export(Array, int) var frames


func enter() -> void:
	owner._change_sprite(frames[randi() % frames.size()])


func collision_resolve(collider_state: String) -> void:
	match(collider_state):
		"Gas":
			emit_signal("finished", "star")
		"Ice":
			emit_signal("finished", "ocean")
		"Iron":
			pass
		"Lava":
			pass
		"Ocean":
			emit_signal("finished", "gas")
		"Terra":
			emit_signal("finished", "lava")
		"Star":
			pass
		"Comet":
			emit_signal("finished", "ocean")
		"Earth":
			pass
		_:
			pass

