class_name State extends Node

static var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

## what happens when the player enters this state
func enter() -> void:
	pass
	
## what happens when player exists this state
func exit() -> void:
	pass

## figure out whether to return idle or walk state
func process(delta: float) -> State:
	return null
	
## what happens during _physics_process
func physics(delta: float) -> State:
	return null
	
func handle_input(event: InputEvent) -> State:
	return null
