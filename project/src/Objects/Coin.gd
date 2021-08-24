extends Area2D

#automated callback -> ready
onready var anim_player: AnimationPlayer = get_node("AnimationPlayer") #reference to animation

export var score: = 10

func _on_Coin_body_entered(body):
	pick_coin()

func pick_coin() -> void:
	PlayerData.score += score
	anim_player.play("fade_out")
