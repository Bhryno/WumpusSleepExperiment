extends KinematicBody2D

var speed = 50

# Vector to 0 to avoid annoying bug of the Wumpus drifting towards the origin
var motion = Vector2.ZERO

var player = null

var wumpus_extended = load("res://assets/WumpusExtended.png")

var wumpus_flat = preload("res://assets/WumpusFlat.png")

onready var sprite = get_node("Sprite")

func _physics_process(delta):
	motion = Vector2.ZERO
	
	if player:
		# Move the Wumpus towards the player's global position
		motion = position.direction_to(player.position) * speed
	motion = move_and_slide(motion)

# Set the texture for the Wumpus when a player enters their range
func _on_Area2D_body_entered(body):
	player = body
	sprite.set_texture(wumpus_extended)
	# Play sound effects
	$AudioStreamPlayer2D.play()

# Set the texture for the Wumpus when a player exits their range
func _on_Area2D_body_exited(body):
	player = null
	sprite.set_texture(wumpus_flat)
	# Stops sound effects
	$AudioStreamPlayer2D.stop()
