extends Node2D

signal return_to_menu
signal level_completed

var playing_level = false
@onready
var initial_player_position = $Player.position
@onready
var initial_player_rotation = $Player.rotation

func start() -> void:
	$UI/GameInterface.visible = true 
	get_tree().paused = false
	playing_level = true
	$Player.turn_on_camera()

func _process(delta: float):
	pass
		
func _input(event: InputEvent) -> void:
	if not playing_level:
		return
	if Input.is_action_just_pressed("Escape"):
		$UI/PauseMenu.visible = not $UI/PauseMenu.visible
		get_tree().paused = not get_tree().paused

func _on_game_interface_escape() -> void:
	$UI/PauseMenu.visible = true
	get_tree().paused = true

func _on_game_interface_walk_forward() -> void:
	$Player.walk_forward()

func _on_game_interface_rotate_left() -> void:
	$Player.rotate_left()

func _on_game_interface_rotate_right() -> void:
	$Player.rotate_right()

func _on_game_interface_stop() -> void:
	$Player.stop()

func _on_pause_menu_continue_game() -> void:
	$UI/PauseMenu.visible = false
	get_tree().paused = false

func _on_pause_menu_return_to_menu() -> void:
	return_to_menu.emit()
	close_level()

func close_level() -> void:
	$UI/GameInterface.visible = false
	$UI/PauseMenu.visible = false
	$Player.turn_off_camera()
	visible = false
	playing_level = false
	$Player/Audio/FactoryAmbiance.playing = false
