extends Node2D

signal return_to_menu
signal level_completed

var playing_level = false
@onready
var initial_player_position = $Player.position
@onready
var initial_player_rotation = $Player.rotation

func start() -> void:
	$UI/NoticeScreen2.visible = true
	$UI/GameInterface.visible = true 
	get_tree().paused = false
	playing_level = true
	$Player.turn_on_camera()
	$Player/Audio/FactoryAmbiance.playing = true

func _process(_delta: float):
	pass
		
func _input(_event: InputEvent) -> void:
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
	$Player/Audio/GOSTRAIGHT_Voiceline.playing = false
	$Player/Audio/GOSTRAIGHT_Voiceline.playing = true
	$Player/Audio/Footsteps.playing = true

func _on_game_interface_rotate_left() -> void:
	$Player/Audio/TURNLEFT_Voiceline.playing = false
	$Player/Audio/TURNLEFT_Voiceline.playing = true
	$Player.rotate_left()

func _on_game_interface_rotate_right() -> void:
	$Player/Audio/TURNRIGHT_Voiceline.playing = false
	$Player/Audio/TURNRIGHT_Voiceline.playing = true
	$Player.rotate_right()

func _on_game_interface_stop() -> void:
	$Player.stop()
	$Player/Audio/STOP_Voiceline.playing = false
	$Player/Audio/STOP_Voiceline.playing = true
	$Player/Audio/Footsteps.playing = false

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
	stop_all_audio()
	$Player.position = initial_player_position
	$Player.rotation = initial_player_rotation
	$Player.stop()

func stop_all_audio() -> void:
	$Player/Audio/FactoryAmbiance.playing = false
	$Player/Audio/Footsteps.playing = false

func _on_player_die() -> void:
	$Player.position = initial_player_position
	$Player.rotation = initial_player_rotation

func _on_level_complete_trigger_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		stop_all_audio()
		close_level()
		level_completed.emit()
