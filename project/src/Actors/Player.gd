extends Actor


func _on_EnemyDetector_body_entered(body):
	queue_free()
	

func _physics_process(delta):
	var is_jumping = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction = calculate_direction()
	_velocity = calculate_velocity(_velocity, direction, speed, is_jumping)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
func calculate_direction() -> Vector2: 
		return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		# -1 => jumping,  1 => falling down
		-1.0 if Input.get_action_strength("jump") and is_on_floor() else 1.0
	);
	
func calculate_velocity(linear_velocity: Vector2, direction: Vector2, speed: Vector2, is_jumping: bool) -> Vector2:
	var new = linear_velocity
	new.x = speed.x * direction.x
	new.y += gravity * get_physics_process_delta_time() #delta = time elapsed til last frame => move constantly
	
	if direction.y == -1.0: # jumping
		new.y = speed.y * direction.y
	if is_jumping:
		new.y = 0.0
	return new
	





