class_name EnemyState extends Node

## Store a reference to enemy and state
var enemy: Enemy
var state_machine: EnemyStateMachine

func init() -> void:
	pass # Replace with function body.

## what happens when the player enters this state
func enter() -> void:
	pass
	
## what happens when player exists this state
func exit() -> void:
	pass

## figure out whether to return idle or walk state
func process(_delta: float) -> EnemyState:
	return null
	
## what happens during _physics_process
func physics(_delta: float) -> EnemyState:
	return null
