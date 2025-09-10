extends Node
class_name Player

@export var player_progression : PlayerProgression
var level = 1
var gold = 20
var health = 50
var max_health = 50
var xp = 0
var mana = 15
var max_mana = 15
var spirit = 3
var max_spirit = 3

signal health_changed(new_value, max)
signal mana_changed(new_value, max)
signal spirit_changed(new_value, max)
signal stats_changed

func add_gold(amount: int) -> void:
	gold += amount
	
func take_damage(amount: int) -> void:
	health = max(0, amount)
	health_changed.emit(health, max_health)
	
func add_xp(amount: int) -> void:
	xp += amount
	if xp >= player_progression.get_xp_required(level):
		level_up()

func level_up() -> void:
	level += 1
	
