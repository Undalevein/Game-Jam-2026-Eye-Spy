extends Control

signal return_to_menu

func _on_return_button_pressed() -> void:
	return_to_menu.emit()
