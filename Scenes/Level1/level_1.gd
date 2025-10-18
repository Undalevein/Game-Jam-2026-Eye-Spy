extends Node2D

signal level_completed

enum {LEFT, RIGHT}

@export
var total_rounds = 5

var round = 1
var monster_position = {"x": 0, "y": 0}
var player_position = {"x": 0, "y": 0}
var closet_positions = []
var near_objects = []
var passed_objects = []

var monster_relative_location = null

const FLAVOR_DIALOGUE = [
	" Please, I am running out of time.",
	" Is, is the monster still there?",
	" I'm scared.",
	" I... I can't do this.",
	" Is it over yet?",
	" Where am I, please tell me!",
	" I can hear them.",
	" Can, can you hear that?",
	" I... can't... feel... my... breath.",
	" Hurry, please."
]

func set_up() -> void:
	#TODO: set up the location of the player and the monster.
	pass

func simulate_round() -> void:
	#TODO: add an algorithm to simulate the player going from one closet to another.
	#TODO
	# Survivor begins running to another closet.
	
	#TODO
	# Monster goes to a position near the survivor.
	
	round += 1
	if round > total_rounds:
		finish_level()

func finish_level():
	#TODO: add more stuff to indicate that the player survived the level.
	level_completed.emit()

func get_dialogue() -> String:
	var dialogue = ""
	# Get the list of objects near the player.
	match near_objects:
		[var a, var b, var c]:
			dialogue += "%s here, %s there, %s over there, no monsters." % [a.capitalize(), b, c]
		[var a, var b]:
			dialogue += "From the outside, I see a %s there, oh, and a %s over there" % [a, b]
		[var a]:
			dialogue += "It looks like I see a %s near me" % a
		[]:
			dialogue += "I see nothing in the halls right now."
	# Get a randomized list of objects the player has passed during the path.
	passed_objects.shuffle()
	var total_announce = randi_range(1, clamp(len(passed_objects), 0, 3))
	match passed_objects:
		[var a, var b, var c, ..] when total_announce == 3:
			dialogue += " I passed the %s first, no wait it was that %s, or was it that %s. I do remember passing these, not sure about the order." % [a, b, c]
		[var a, var b, ..] when total_announce == 2:
			dialogue += " All I remember is passing two things: a %s and that %s." % [a, b]
		[var a, ..] when total_announce == 1:
			dialogue += " Did pass by a %s I believe." % a
		[]:
			dialogue += " I don't think I notice anything while running."
	# Adds a random flavor dialogue.
	if randi() % 7 == 1:
		dialogue += FLAVOR_DIALOGUE[randi_range(0,len(FLAVOR_DIALOGUE) - 1)]
	return dialogue

func reset() -> void:
	pass
