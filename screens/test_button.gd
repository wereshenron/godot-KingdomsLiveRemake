extends Button

func _on_button_up() -> void:
	Player.take_damage(5)
