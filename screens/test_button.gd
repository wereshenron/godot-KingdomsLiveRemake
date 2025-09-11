extends Button


func _on_button_up() -> void:
	GlobalEvents.test_button_pressed.emit(10)
