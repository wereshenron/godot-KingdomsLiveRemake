extends Node

@onready var player_progression: PlayerProgression = preload("res://player/player_progression.tres")
@onready var player_data: PlayerData = preload("res://player/player_data.tres")
@onready var test_button = preload("res://screens/home_screen.tscn")

func _ready() -> void:
	player_data.leveled_up.connect(_on_level_up)
	
	# testing 
	GlobalEvents.test_button_pressed.connect(take_damage)

func add_gold(amount: int) -> void:
	player_data.gold += amount
	
func take_damage(amount: int) -> void:
	player_data.health -= amount
	
func add_xp(amount: int) -> void:
	player_data.add_xp(amount)

func _on_level_up() -> void:
	print('leveled up! to level %d' % player_data.level)	
