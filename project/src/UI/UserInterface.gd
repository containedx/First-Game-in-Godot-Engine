extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("PauseOverlay")
onready var gameover_overlay: ColorRect = get_node("GameOverOverlay")
onready var score: Label = get_node("Score Label")
onready var anim_player: AnimationPlayer = $AnimationPlayer


var paused: = false setget set_paused

func _ready(): #called before everything
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "on_Player_player_died")
	
func on_Player_player_died():
	anim_player.play("game_over")
	gameover_overlay.visible = true

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.paused = !paused
		scene_tree.set_input_as_handled()

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
	
	
func update_interface():
	score.text = "SCORE: %s" % PlayerData.score
