extends Node2D

@export
var current_level = 1

@onready
var main_menu = $UI/Camera2D/CanvasLayer/MainMenu
@onready
var game_interface = $UI/Camera2D/CanvasLayer/GameInterface
@onready
var win_menu = $UI/Camera2D/CanvasLayer/Win

func start_level() -> void:
	# TODO create levels and connect them to the match block below.
	match current_level:
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		_:
			show_win_screen()

func show_win_screen() -> void:
	game_interface.visible = false
	win_menu.visible = true

func _on_main_menu_start_game() -> void:
	main_menu.visible = false
	game_interface.visible = true
	start_level()

func _on_win_return_to_menu() -> void:
	win_menu.visible = false
	main_menu.visible = true
	current_level = 1

func _on_loss_return_to_menu() -> void:
	win_menu.visible = false
	main_menu.visible = true
