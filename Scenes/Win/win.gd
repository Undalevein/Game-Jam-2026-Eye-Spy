extends Control

signal return_to_menu

func _on_close_button_pressed() -> void:
	return_to_menu.emit()
