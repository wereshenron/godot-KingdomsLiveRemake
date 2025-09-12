extends Node

@onready var player_progression: PlayerProgression = preload("res://player/player_progression.tres")
@onready var player_data: PlayerData = preload("res://player/player_data.tres")
@onready var test_button = preload("res://screens/home_screen.tscn")

signal lost_health
signal lost_mana
signal lost_spirit

func _ready() -> void:
	player_data.leveled_up.connect(_on_level_up)
	
func change_stat(stat: StatEnum.Stat, amount: int) -> void:
	match stat:
		StatEnum.Stat.HEALTH:
			player_data.health += amount
			if amount < 0:
				lost_health.emit()
		
		StatEnum.Stat.MANA:
			player_data.mana += amount
			if amount < 0:
				lost_mana.emit()
		
		StatEnum.Stat.SPIRIT:
			player_data.spirit += amount
			if amount < 0:
				lost_spirit.emit()
				
		StatEnum.Stat.GOLD:
			player_data.gold += amount
			
		StatEnum.Stat.XP:
			player_data.xp += amount
			
# Returns current status of stat and the current max value, if applicable
func get_stat(stat: StatEnum.Stat) -> Array[int]:
	var current_stat: int
	var max_stat: int
	
	match stat:
		StatEnum.Stat.HEALTH:
			current_stat = player_data.health
			max_stat = player_progression.max_health[player_data.level]
		
		StatEnum.Stat.MANA:
			current_stat = player_data.mana
			max_stat = player_progression.max_mana[player_data.level]
		
		StatEnum.Stat.SPIRIT:
			current_stat = player_data.spirit
			max_stat = player_progression.max_spirit[player_data.level]
			
		StatEnum.Stat.GOLD:
			current_stat = player_data.gold
			
		StatEnum.Stat.XP:
			current_stat = player_data.xp
			max_stat = player_progression.xp_cap[player_data.level]
	
	return [current_stat, max_stat]

func _on_level_up() -> void:
	player_data.health = player_progression.max_health[player_data.level]
	player_data.mana = player_progression.max_mana[player_data.level]
	player_data.spirit = player_progression.max_spirit[player_data.level]
