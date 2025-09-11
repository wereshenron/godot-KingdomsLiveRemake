extends Node

@onready var player_progression: PlayerProgression = preload("res://player/player_progression.tres")
@onready var player_data: PlayerData = preload("res://player/player_data.tres")
@onready var test_button = preload("res://screens/home_screen.tscn")

func _ready() -> void:
	player_data.leveled_up.connect(_on_level_up)

func add_gold(amount: int) -> void:
	player_data.gold += amount
	
func take_damage(amount: int) -> void:
	player_data.health -= amount
	#ResourceSaver.save(player_data) # Testing saving in between runs
	
func add_xp(amount: int) -> void:
	player_data.xp += amount
	
func spend_mana(amount: int) -> void:
	player_data.mana -= amount

func _on_level_up() -> void:
	player_data.health = player_progression.max_health[player_data.level]
	player_data.mana = player_progression.max_mana[player_data.level]
	player_data.spirit = player_progression.max_spirit[player_data.level]
