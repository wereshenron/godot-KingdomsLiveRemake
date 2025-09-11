class_name PlayerProgression 
extends Resource

@export var xp_cap: Array[int]
@export var max_health: Array[int]
@export var max_mana: Array[int]
@export var max_spirit: Array[int]

func get_stat_requirement_by_level(level: int, stat: Array[int]) -> int:
	if level < stat.size():
		return stat[level]
	return stat.back()
