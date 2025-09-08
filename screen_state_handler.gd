extends Node

@onready var home_screen = $HomeScreen
@onready var current_screen = home_screen

var screens = {
	"Quests" : preload("res://screens/quest_screen.tscn"),
	"Battle" : preload("res://screens/battle_screen.tscn"),
	"Armory" : preload("res://screens/armory_screen.tscn"),
	"Land" : preload("res://screens/land_screen.tscn"),
}
var visited_screens = {}

func _show_screen(screen_name: String) -> void:
	var screen
	if current_screen:
		current_screen.visible = false
	if not visited_screens.has(screen_name):
		var new_screen = screens[screen_name].instantiate()
		visited_screens[screen_name] = new_screen
		screen = new_screen
		add_child(new_screen)
	else:
		screen = visited_screens[screen_name]

	current_screen = screen
	current_screen.visible = true
	
func _on_home_button_up() -> void:
	if current_screen == home_screen: 
		return
		
	current_screen.visible = false
	current_screen = home_screen
	home_screen.visible = true

func _on_quest_button_up() -> void:
	_show_screen("Quests")

func _on_battle_button_up() -> void:
	_show_screen("Battle")

func _on_armory_button_up() -> void:
	_show_screen("Armory")

func _on_land_button_up() -> void:
	_show_screen("Land")
