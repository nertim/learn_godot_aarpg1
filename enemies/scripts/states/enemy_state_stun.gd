class_name EnemyStateStun extends EnemyState

@export var anim_name: String = "stun"
@export var knockback_speed: float = 100.0
@export var decelarate_speed: float = 10.0

@export_category("AI")
@export var next_state: EnemyState

var _direction: Vector2
var _animation_finished: bool = false

func init() -> void:
	enemy.enemy_damage.connect(_on_enemy_damage)
	pass # Replace with function body.

## what happens when the player enters this state
func enter() -> void:
	enemy.invulnerable = true
	_animation_finished = false
	
	_direction = enemy.global_position.direction_to(enemy.player.global_position)
	
	enemy.update_direction(_direction)
	enemy.velocity = _direction * -knockback_speed
	enemy.update_animation(anim_name)
	enemy.animation_player.animation_finished.connect(_on_animation_finished)
	pass
	
## what happens when player exists this state
func exit() -> void:
	enemy.invulnerable = false
	enemy.animation_player.animation_finished.disconnect(_on_animation_finished)
	pass
	
## figure out whether to return idle or walk state
func process(_delta: float) -> EnemyState:
	if _animation_finished == true:
		return next_state
		
	enemy.velocity -= enemy.velocity * decelarate_speed * _delta
	return null
	
## what happens during _physics_process
func physics(_delta: float) -> EnemyState:
	return null

func _on_enemy_damage() -> void:
	state_machine.change_state(self)

func _on_animation_finished(_a: String) -> void:
	_animation_finished = true
