extends Actor

#analogic to unity start()
func _ready():
	_velocity.x = -speed.x #move towards left at start

func _physics_process(delta):
	if is_on_wall():
		_velocity.x *= -1.0 #turn back when hit the wall
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
