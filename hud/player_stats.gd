extends Node

@onready var player_data: PlayerData = Player.player_data
@onready var player_progression: PlayerProgression = Player.player_progression
@onready var level = $Level
@onready var level_progress_bar = $Level/TextureProgressBar
@onready var gold_label = $GoldNavbarEntry/Label
@onready var health_label = $HealthNavbarEntry/Label
@onready var mana_label = $Mana/Label
@onready var spirit_label = $Spirit/Label

var level_format = "Lv. %s"
var ratio_format = "%d / %d"

func _ready() -> void:
	# Connect Signals
	player_data.leveled_up.connect(set_all)
	player_data.gold_changed.connect(set_gold)
	player_data.health_changed.connect(set_health)
	player_data.mana_changed.connect(set_mana)
	player_data.spirit_changed.connect(set_spirit)
	player_data.xp_changed.connect(set_xp)
	
	# Set initial values
	set_all()

func set_health() -> void:
	health_label.text = ratio_format % [player_data.health, player_progression.max_health[player_data.level]]
	
func set_level() -> void:
	level.text = level_format % player_data.level

func set_gold() -> void:
	gold_label.text = "%s" % player_data.gold

func set_mana() -> void:
	mana_label.text = ratio_format % [player_data.mana, player_progression.max_mana[player_data.level]]

func set_spirit() -> void:
	spirit_label.text = ratio_format % [player_data.spirit, player_progression.max_spirit[player_data.level]]
	
func set_xp() -> void:
	var xp_float = float(player_data.xp)
	var xp_cap_float = float(player_progression.xp_cap[player_data.level])
	var xp_cap_prev_level_float = float(player_progression.xp_cap[player_data.level - 1])
	var xp_progress = (xp_float - xp_cap_prev_level_float) / (xp_cap_float - xp_cap_prev_level_float)
	
	level_progress_bar.value = xp_progress * 100

func set_all() -> void: 
	set_level()
	set_xp()
	set_health()
	set_gold()
	set_mana()
	set_spirit()
