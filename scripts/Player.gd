extends KinematicBody2D

var velocity: Vector2 = Vector2()

var direction: Vector2 = Vector2()

# Event for physics processing
func _physics_process(delta):
	read_input()

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
	
	# Has to be normalized to disable acceleration
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 100)
