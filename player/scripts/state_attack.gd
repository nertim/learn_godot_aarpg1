class_name StateAttack extends State

@export var attack_sound: AudioStream
@export_range(1, 20, 0.5) var decelerate_speed: float = 5.0

var attacking: bool = false
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_anim: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var walk: State = $"../Walk"
@onready var idle: State = $"../Idle"
@onready var audio: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

## what happens when the player enters this state
func enter() -> void:
	player.upate_animation("attack")
	attack_anim.play("attack_" + player.animation_direction())
	animation_player.animation_finished.connect(end_attack)
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9, 1.1)
	audio.play()
	attacking = true
	pass
	
## what happens when player exists this state
func exit() -> void:
	animation_player.animation_finished.disconnect(end_attack)
	attacking = false
	pass

## figure out whether to return idle or walk state
func process(delta: float) -> State:
	player.velocity -= player.velocity * decelerate_speed * delta
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null
	
## what happens during _physics_process
func physics(_delta: float) -> State:
	return null
	
func handle_input(_event: InputEvent) -> State:
	return null

func end_attack(_new_anim_name: String) -> void:
	attacking = false
	pass
