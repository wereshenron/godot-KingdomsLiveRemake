extends Control

func _on_health_button_up() -> void:
	Player.change_stat(StatEnum.Stat.HEALTH, -2)

func _on_xp_button_up() -> void:
	Player.change_stat(StatEnum.Stat.XP, 10)

func _on_mana_button_up() -> void:
	Player.change_stat(StatEnum.Stat.MANA, -3)

func _on_spirit_button_up() -> void:
	Player.change_stat(StatEnum.Stat.SPIRIT, -1)

func _on_gold_button_up() -> void:
	Player.change_stat(StatEnum.Stat.GOLD, 20)
