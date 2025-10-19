extends Node2D

@export_range(1,6,1)
var current_level = 1
@export
var X_PAN_SPEED = 2.0
@export
var Y_PAN_SPEED = 2.0

var in_level = false
var time = 0.0

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
var level1 = $Levels/Level1

var initial_camera_position = Vector2()

func _ready() -> void:
	initial_camera_position = camera.position

func _process(delta: float) -> void:
	if not in_level:
		return
	if Input.is_action_just_pressed("Escape"):
		pause_menu.visible = not pause_menu.visible

func start_level() -> void:
	in_level = current_level >= 1 and current_level <= 5
	camera.position = initial_camera_position
	match current_level:
		1:
			start_level_1()
		2:
			start_level_2()
		3:
			start_level_3()
		_:
			show_win_screen()

func start_level_1() -> void:
	level1.visible = true

func start_level_2() -> void:
	pass

func start_level_3() -> void:
	pass

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

func _on_pause_menu_continue_game() -> void:
	pause_menu.visible = not pause_menu.visible

func _on_pause_menu_return_to_menu() -> void:
	in_level = false
	level1.visible = false
	pause_menu.visible = false
	game_interface.visible = false
	main_menu.visible = true

func _on_game_interface_escape() -> void:
	pause_menu.visible = not pause_menu.visible
