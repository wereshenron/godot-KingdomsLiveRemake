class_name PlayerData
extends Resource

@export var player_progression: PlayerProgression
@export var xp: int
@export var level: int : set = set_level
@export var health: int : set = set_health
@export var mana: int : set = set_mana
@export var spirit: int : set = set_spirit
@export var gold: int : set = set_gold

signal leveled_up
signal health_changed
signal mana_changed
signal spirit_changed
signal gold_changed

func set_level(value: int) -> void:
	level = max(1, value)
	level_up()

func add_xp(value: int) -> void:
	xp += value
	if xp >= player_progression.xp_cap[level]:
		set_level(level + 1)

func set_health(value: int) -> void:
	health = max(0, value)
	health_changed.emit()

func set_mana(value: int) -> void:
	mana = max(0, value)
	mana_changed.emit()

func set_spirit(value: int) -> void:
	spirit = max(0, value)
	spirit_changed.emit()

func set_gold(value: int) -> void:
	gold = max(0, value)
	gold_changed.emit()

func level_up() -> void:
	leveled_up.emit()
