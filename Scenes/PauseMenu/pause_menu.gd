extends Control

signal continue_game
signal return_to_menu

func _on_continue_button_pressed() -> void:
	continue_game.emit()

func _on_main_menu_button_pressed() -> void:
	return_to_menu.emit()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
