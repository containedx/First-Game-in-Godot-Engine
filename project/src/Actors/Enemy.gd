extends Actor

#analogic to unity start()
func _ready():
	_velocity.x = -speed.x #move towards left at start

func _physics_process(delta):
	_velocity.y += gravity * delta
	if is_on_wall():
		_velocity.x *= -1.0 #turn back when hit the wall
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
