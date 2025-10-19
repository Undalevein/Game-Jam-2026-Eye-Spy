extends Node2D

@export
var current_level = 1

var in_level = false

func _on_main_menu_start_game() -> void:
	$MainUI.visible = false
	match current_level:
		1: 
			$Levels/Level1.visible = true
			$Levels/Level1.start()
		2:
			$Levels/Level2.visible = true
			$Levels/Level2.start()
		3:
			$Levels/Level3.visible = true
			$Levels/Level3.start()
		_:
			play_win()

func play_win() -> void:
	pass

func _on_level_1_return_to_menu() -> void:
	$MainUI.visible = true

func _on_level_2_return_to_menu() -> void:
	$MainUI.visible = true

func _on_level_3_return_to_menu() -> void:
	$MainUI.visible = true
