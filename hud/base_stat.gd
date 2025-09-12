class_name BaseStat
extends Control

@onready var timer: Timer = $Timer
@onready var timer_label = $EntryHbox/Stats/Timer
@onready var status = $EntryHbox/Stats/Status

@export var cooldown_duration: int

func _ready() -> void:
	timer.timeout.connect(cooldown_finished)

func _process(delta: float) -> void:
	if timer.is_stopped():
		timer_label = ""
	else:
		timer_label = format_time(timer.time_left)

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
	pass # Define in child classes
