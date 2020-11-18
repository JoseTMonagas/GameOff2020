extends State

export(Array, int) var frames


func enter() -> void:
	owner._change_sprite(frames[randi() % frames.size()])


func collision_resolve(collider_state: String) -> void:
	match(collider_state):
		"Gas":
			pass
		"Ice":
			emit_signal("finished", "ocean")
		"Iron":
			pass
		"Lava":
			pass
		"Ocean":
			emit_signal("finished", "terra")
		"Terra":
			pass
		"Star":
			pass
		"Comet":
			pass
		"Earth":
			pass
		_:
			pass
