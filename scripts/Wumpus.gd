extends KinematicBody2D

var speed = 50

var motion = Vector2.ZERO

var player = null

var wumpus_extended = load("res://assets/WumpusExtended.png")

var wumpus_flat = preload("res://assets/WumpusFlat.png")

onready var sprite = get_node("Sprite")

func _physics_process(delta):
	motion = Vector2.ZERO
	
	if player:
		motion = position.direction_to(player.position) * speed
	motion = move_and_slide(motion)


func _on_Area2D_body_entered(body):
	player = body
	sprite.set_texture(wumpus_extended)
	$AudioStreamPlayer2D.play()


func _on_Area2D_body_exited(body):
	player = null
	sprite.set_texture(wumpus_flat)
	$AudioStreamPlayer2D.stop()
