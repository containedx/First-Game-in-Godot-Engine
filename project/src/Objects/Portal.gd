tool
extends Area2D

onready var anim_player: AnimationPlayer = $AnimationPlayer # == get_node("AnimationPlayer")

export var next_level: PackedScene


func _on_Portal_body_entered(body):
	teleport()

# warning in inspector
func _get_configuration_warning():
	return "There is no next level" if not next_level else ""
	
# teleporting to next level
func teleport() -> void:
	anim_player.play("black_screen")
	yield(anim_player, "animation_finished") #waiting till the end of animation
	get_tree().change_scene_to(next_level) 
	

