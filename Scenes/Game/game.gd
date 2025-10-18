extends Node2D

@export_range(1,6,1)
var current_level = 1
var in_level = false

@onready
var camera = $UI/Camera2D
@onready
var main_menu = $UI/Camera2D/CanvasLayer/MainMenu
@onready
var game_interface = $UI/Camera2D/CanvasLayer/GameInterface
@onready
var pause_menu = $UI/Camera2D/CanvasLayer/PauseMenu
@onready
var win_menu = $UI/Camera2D/CanvasLayer/Win
@onready
var background = $Background

func _process(delta: float) -> void:
	background.set_position(camera.global_position)

func _input(event: InputEvent) -> void:
	if not in_level:
		return
	if Input.is_action_just_pressed("Escape"):
		pause_menu.visible = not pause_menu.visible
		

func start_level() -> void:
	# TODO create levels and connect them to the match block below.
	in_level = current_level >= 1 and current_level <= 5
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

func _on_pause_menu_continue_game() -> void:
	pause_menu.visible = not pause_menu.visible

func _on_pause_menu_return_to_menu() -> void:
	in_level = false
	pause_menu.visible = false
	game_interface.visible = false
	main_menu.visible = true
