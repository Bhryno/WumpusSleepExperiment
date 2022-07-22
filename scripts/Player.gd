extends KinematicBody2D

var velocity: Vector2 = Vector2()

var direction: Vector2 = Vector2()

var bullet = preload("res://scenes/Bullet.tscn")

var bullet_speed = 150

var can_shoot: bool

# Event for physics processing
func _physics_process(delta):
	read_input()
	
func _on_Area2D_1_body_entered(body):
	if "Wumpus" in body.name:
		kill()

func read_input():
	velocity = Vector2()
	
	# Gets specific key mappings and handles their events
	if Input.is_action_pressed("Forward"):
		velocity.y -= 1
		direction = Vector2(0, -1)
		$AnimationPlayer.play("WalkUp")
	if Input.is_action_pressed("Back"):
		velocity.y += 1
		direction = Vector2(0, 1)
		$AnimationPlayer.play("WalkDown")
	if Input.is_action_pressed("Left"):
		velocity.x -= 1
		direction = Vector2(-1, 0)

	if Input.is_action_pressed("Right"):
		velocity.x += 1
		direction = Vector2(1, 0)
		
	if Input.is_action_pressed("Hotbar_Slot_0"):
		can_shoot = false
	elif Input.is_action_pressed("Hotbar_Slot_1"):
		can_shoot = true
	
	# Has to be normalized to disable acceleration
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 75)
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("LMB"):
		fire()

func fire():
	if can_shoot:
		var bullet_instance = bullet.instance()
	
		bullet_instance.position = get_global_position()
		bullet_instance.rotation_degrees
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0). rotated(rotation))
		get_tree().get_root().call_deferred("add_child", bullet_instance)

func kill():
	pass
