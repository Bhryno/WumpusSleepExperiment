extends KinematicBody2D

var speed = 50

var motion = Vector2.ZERO

var player = null

onready var sprite = get_node("Sprite")

var wumpus_flat = preload("res://assets/WumpusFlat.png")

var wumpus_extended = load("res://assets/WumpusExtended.png")

func _physics_process(delta):
	motion = Vector2.ZERO
	
	if player:
		motion = position.direction_to(player.position) * speed
	
	motion = move_and_slide(motion)

func _on_Area2D_body_entered(body):
	player = body
	sprite.set_texture(wumpus_extended)
	if "Bullet" in body.name:
		queue_free()

func _on_Area2D_body_exited(body):
	player = null
	sprite.set_texture(wumpus_flat)
