extends Node

signal score_updated
signal player_died

# setget => going to send value to function in order to process any changing of value => basically setter function
var score : = 0 setget set_score

func set_score(value: int):
	score = value
	emit_signal("score_updated")

func player_dead():
	emit_signal("player_died")
	
func reset():
	score = 0
