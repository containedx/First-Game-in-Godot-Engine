extends KinematicBody2D
class_name Actor

export var speed: = Vector2(300.0, 1000.0)
export var gravity: = 500.0
var velocity: = Vector2.ZERO

#function similar to unity Update
func _physics_process(delta: float) -> void:	
	velocity.y += gravity * delta #delta = time elapsed til last frame => move constantly
	#velocity.y = max(velocity.y, speed.y)
	velocity = move_and_slide(velocity)
