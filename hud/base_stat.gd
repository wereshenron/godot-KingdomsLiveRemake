class_name BaseStat
extends Control

@onready var timer: Timer = $Timer
@onready var timer_label = $EntryHbox/Stats/Timer
@onready var status = $EntryHbox/Stats/Status

@export var cooldown_duration: float # In seconds
@export var stat: StatEnum.Stat

func _ready() -> void:
	match stat:
		StatEnum.Stat.HEALTH:
			Player.lost_health.connect(_on_stat_lost)
	timer.timeout.connect(cooldown_finished)

func _process(delta: float) -> void:
	if timer.is_stopped():
		timer_label.text = ""
	else:
		timer_label.text = format_time(timer.time_left)

func start_cooldown() -> void:
	timer.wait_time = cooldown_duration
	timer.start()
	
func format_time(seconds: float) -> String:
	var mins = int(seconds) / 60
	var secs = int(seconds) % 60
	return "%d:%02d" % [mins, secs]
	
func stop_timer() -> void:
	timer.stop()

func cooldown_finished() -> void:
	Player.change_stat(stat, 1)
	
	var current_state: Array[int] = Player.get_stat(stat)
	var current = current_state.front()
	var max = current_state.back()
	
	if current == max:
		stop_timer()
	
func _on_stat_lost() -> void:
	if timer.is_stopped():
		start_cooldown()
