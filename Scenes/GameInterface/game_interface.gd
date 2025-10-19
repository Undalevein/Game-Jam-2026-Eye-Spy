extends Control

signal walk_forward
signal rotate_left
signal rotate_right
signal stop
signal escape

func _on_escape_button_pressed() -> void:
	escape.emit()

func _on_straight_button_pressed() -> void:
	walk_forward.emit()

func _on_turn_left_button_pressed() -> void:
	rotate_left.emit()

func _on_turn_right_button_pressed() -> void:
	rotate_right.emit()

func _on_stop_button_pressed() -> void:
	stop.emit()
