class_name StateIdle extends State

@onready var walk: State = $"../Walk"

## what happens when the player enters this state
func enter() -> void:
	player.upate_animation("idle")
	pass
	
## what happens when player exists this state
func exit() -> void:
	pass

## figure out whether to return idle or walk state
func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
		
	player.velocity = Vector2.ZERO
	return null
	
## what happens during _physics_process
func physics(_delta: float) -> State:
	return null
	
func handle_input(_event: InputEvent) -> State:
	return null
