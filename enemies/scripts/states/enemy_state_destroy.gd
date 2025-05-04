class_name EnemyStateDestroy extends EnemyState

@export var anim_name: String = "destroy"
@export var knockback_speed: float = 100.0
@export var decelarate_speed: float = 10.0

var _direction: Vector2

func init() -> void:
	enemy.enemy_destroyed.connect(_on_enemy_destroyed)
	pass # Replace with function body.

## what happens when the player enters this state
func enter() -> void:
	enemy.invulnerable = true
	
	_direction = enemy.global_position.direction_to(enemy.player.global_position)
	
	enemy.update_direction(_direction)
	enemy.velocity = _direction * -knockback_speed
	enemy.update_animation(anim_name)
	enemy.animation_player.animation_finished.connect(_on_animation_finished)
	pass
	
## what happens when player exists this state
func exit() -> void:
	pass
	
## figure out whether to return idle or walk state
func process(_delta: float) -> EnemyState:
	enemy.velocity -= enemy.velocity * decelarate_speed * _delta
	return null
	
## what happens during _physics_process
func physics(_delta: float) -> EnemyState:
	return null

func _on_enemy_destroyed() -> void:
	state_machine.change_state(self)

func _on_animation_finished(_a: String) -> void:
	enemy.queue_free()
