extends Actor

#analogic to unity start()
func _ready():
	set_physics_process(false) #enemy dont enter the screen from outside -> it starts moving only when visible on screen
	_velocity.x = -speed.x #move towards left at start
	
func _on_HitDetector_body_entered(body):
	queue_free() #delete the enemy


func _physics_process(delta):
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0 #turn back when hit the wall
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y



