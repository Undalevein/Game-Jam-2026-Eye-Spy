extends Control

signal closed_window

func _on_close_button_pressed() -> void:
	visible = false
	closed_window.emit()
