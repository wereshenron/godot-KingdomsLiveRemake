class_name PlayerProgression 
extends Resource

@export var xp: Array[int]
@export var max_health: Array[int]
@export var max_mana: Array[int]
@export var max_spirit: Array[int]

func get_xp_required(level: int) -> int:
	if level < xp.size():
		return xp[level + 1] 
	return xp.back()
