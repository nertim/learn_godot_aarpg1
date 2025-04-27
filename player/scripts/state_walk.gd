class_name StateWalk extends State

@export var move_speed: float = 100.0

@onready var idle: State = $"../Idle"

## what happens when the player enters this state
func enter() -> void:
	player.upate_animation("walk")
	pass
	
## what happens when player exists this state
func exit() -> void:
	pass

## figure out whether to return idle or walk state
func process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.update_direction():
		player.upate_animation("walk")
		
	return null
	
## what happens during _physics_process
func physics(_delta: float) -> State:
	return null
	
func handle_input(_event: InputEvent) -> State:
	return null
