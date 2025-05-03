class_name EnemyStateIdle extends EnemyState

@export var anim_name: String = "idle"

@export_category("AI")
@export var state_duration_min: float = 0.5
@export var state_duration_max: float = 1.5
@export var after_idle_state: EnemyState

var _timer: float = 0.0

func init() -> void:
	pass # Replace with function body.

## what happens when the player enters this state
func enter() -> void:
	enemy.velocity = Vector2.ZERO
	_timer = randf_range(state_duration_min, state_duration_max)
	enemy.update_animation(anim_name)
	pass
	
## what happens when player exists this state
func exit() -> void:
	pass
	
## figure out whether to return idle or walk state
func process(_delta: float) -> EnemyState:
	_timer -= _delta
	
	if _timer <= 0:
		return after_idle_state
	
	return null
	
## what happens during _physics_process
func physics(_delta: float) -> EnemyState:
	return null
