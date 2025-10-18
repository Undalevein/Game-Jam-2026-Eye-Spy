extends Node2D

var current_level = 0

func _on_main_menu_start_game() -> void:
	$UI/Camera2D/CanvasLayer/MainManu.enabled = false
	$UI/Camera2D/CanvasLayer/GameInterface.enabled = true
