extends CharacterBody2D

signal die

enum Rotations {LEFT, RIGHT, NONE}

@export
var walking_speed = 3.0
@export
var rotate_speed = 3.0

var walking = false
var rotation_direction = Rotations.NONE

func _ready():
	turn_off_camera()

func _physics_process(delta: float) -> void:
	if walking:
		var velocity_stuff = Vector2(0, -1).rotated(rotation) * walking_speed
		move_and_collide(velocity_stuff * delta)
	match rotation_direction:
		Rotations.LEFT:
			rotation -= rotate_speed * delta
		Rotations.RIGHT:
			rotation += rotate_speed * delta

func walk_forward() -> void:
	walking = true

func rotate_left() -> void:
	rotation_direction = Rotations.LEFT

func rotate_right() -> void:
	rotation_direction = Rotations.RIGHT

func stop() -> void:
	walking = false
	rotation_direction = Rotations.NONE

func turn_on_camera() -> void:
	$Camera2D.enabled = true

func turn_off_camera() -> void:
	$Camera2D.enabled = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	walking = false
	rotation_direction = Rotations.NONE
	if area.is_in_group("Hazard"):
		die.emit()
