extends Control

signal go_straight
signal turn_left
signal turn_right
signal stop
signal escape

func _on_escape_button_pressed() -> void:
	escape.emit()

func _on_straight_button_pressed() -> void:
	go_straight.emit()

func _on_turn_left_button_pressed() -> void:
	turn_left.emit()

func _on_turn_right_button_pressed() -> void:
	turn_right.emit()

func _on_stop_button_pressed() -> void:
	stop.emit()
