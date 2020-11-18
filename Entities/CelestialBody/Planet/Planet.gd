extends RigidBody2D

const MASS_TO_SCALE_RATIO: float = 1000.0
const MAX_SCALE: Vector2 = Vector2(25, 25)
const MIN_SCALE: Vector2 = Vector2(1, 1)

export var MAX_LIFETIME: int = ProjectSettings.get("physics/2d/planet_lifetime")
export var IS_MOON: bool = false

export var _mass: float = 1.0 setget _set_mass, get_mass

var _lifetime: int setget , get_lifetime
var _scale: Vector2 = scale

onready var celestialStateMachine: StateMachine = $CelestialStateMachine
onready var sprite: Sprite = $Sprite
onready var tween: Tween = $Tween


func _ready() -> void:
	_lifetime = OS.get_ticks_msec()
	
	if not IS_MOON:
		randomize()
		_mass = randi() % 100 + 1
		linear_velocity = Vector2(randf(), randf())


func _physics_process(delta: float) -> void:
	if self._lifetime > MAX_LIFETIME and not IS_MOON:
		queue_free()


func get_state() -> String:
	return celestialStateMachine.current_state.name


func get_mass() -> float:
	return _mass


func get_lifetime() -> int:
	return OS.get_ticks_msec() - _lifetime


func _change_state(collider_state: String) -> void:
	celestialStateMachine.state_collision(collider_state)


func _resolve_collision(collider: RigidBody2D) -> void:
	var delta_mass: float = _mass - collider.get_mass()
	
	if IS_MOON:
		print(collider.get_mass())
	
	if delta_mass > 0:
		_increase_mass(1)
	elif delta_mass < 0:
		_decrease_mass(-1)


func _set_mass(new_mass: float) -> void:
	_mass = new_mass
	var _scale = $Sprite.scale + $Sprite.scale * (_mass / MASS_TO_SCALE_RATIO)
	_scaling_mass(_scale)


func _increase_mass(amount: float) -> void:
	self._mass = _mass + amount


func _decrease_mass(amount: float) -> void:
	self._mass = _mass - amount
	
	if _mass < 0:
		queue_free()


func _scale(value: Vector2) -> void:
	$Sprite.scale = value
	$CollisionShape2D.shape.radius = $Sprite.get_rect().size.x
	$Orbit.scale = value


func _scaling_mass(new_scale: Vector2) -> void:
	if tween == null:
		yield(self, "ready")
	
	if !tween.is_active():
		new_scale.x = clamp(new_scale.x, MIN_SCALE.x, MAX_SCALE.x)
		new_scale.y = clamp(new_scale.y, MIN_SCALE.y, MAX_SCALE.y)
		
		tween.interpolate_method(
			self, "_scale", $Sprite.scale,new_scale,
			1.5, Tween.TRANS_LINEAR, Tween.EASE_OUT
		)
		tween.start()


func _on_body_entered(body: PhysicsBody2D) -> void:
	assert(body.has_method("get_state"))
	
	_change_state(body.get_state())
	_resolve_collision(body)


func _on_body_exited(body: PhysicsBody2D) -> void:
	pass


func _on_change_sprite(frame: int) -> void:
	if sprite == null:
		yield(self, "ready")
		sprite.frame = frame
	else:
		sprite.frame = frame
