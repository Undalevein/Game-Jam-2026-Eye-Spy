extends Node2D

signal return_to_menu
signal level_completed

func _on_visibility_changed() -> void:
	# Check if we are starting the game.
	if visible:
		$UI/GameInterface.visible = true 
		get_tree().paused = false

func _process(delta: float):
	pass
		
func _unhandled_input(event: InputEvent) -> void:
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
	visible = false
