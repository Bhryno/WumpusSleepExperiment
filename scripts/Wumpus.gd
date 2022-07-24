extends KinematicBody2D

var speed = 75

var motion = Vector2.ZERO

var player = null

onready var sprite = get_node("Sprite")

var wumpus_flat = preload("res://assets/WumpusFlat.png")

var wumpus_extended = load("res://assets/WumpusExtended.png")

func _ready():
	$Menu/Win.pause_mode = PAUSE_MODE_PROCESS

func _process(delta):
	$Menu/Win.pause_mode = PAUSE_MODE_PROCESS

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
		get_tree().paused = true
		visible = true

func _on_Area2D_body_exited(body):
	player = null
	sprite.set_texture(wumpus_flat)
