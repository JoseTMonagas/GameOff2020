extends State


export(Array, int) var frames


func enter() -> void:
	owner._change_sprite(frames[randi() % frames.size()])


func collision_resolve(collider_state: String) -> void:
	match(collider_state):
		"Gas":
			emit_signal("finished", "ice")
		"Ice":
			emit_signal("finished", "ice")
		"Iron":
			emit_signal("finished", "terra")
		"Lava":
			emit_signal("finished", "gas")
		"Ocean":
			pass
		"Terra":
			emit_signal("finished", "earth")
		"Star":
			emit_signal("finished", "gas")
		"Comet":
			emit_signal("finished", "ice")
		"Earth":
			pass
		_:
			pass
