extends Actor


func _physics_process(delta):
	var direction = calculate_direction()
	velocity = calculate_velocity(velocity, direction, speed)
	velocity = move_and_slide(velocity, FLOOR_NORMAL)
	
func calculate_direction() -> Vector2: 
		return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		# -1 => jumping,  1 => falling down
		-1.0 if Input.get_action_strength("jump") and is_on_floor() else 1.0
	);
	
func calculate_velocity(linear_velocity: Vector2, direction: Vector2, speed: Vector2) -> Vector2:
	var new_velocity = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time() #delta = time elapsed til last frame => move constantly
	
	if direction.y == -1.0: # jumping
		new_velocity.y = speed.y * direction.y
		
	return new_velocity
	


