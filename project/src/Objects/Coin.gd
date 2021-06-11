extends Area2D

#automated callback -> ready
onready var anim_player: AnimationPlayer = get_node("AnimationPlayer") #reference to animation


func _on_Coin_body_entered(body):
	anim_player.play("fade_out")
