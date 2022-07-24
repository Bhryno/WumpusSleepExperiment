extends Node2D

var wumpus_scene = preload("res://scenes/Wumpus.tscn")

var wumpus = wumpus_scene.instance()

func _ready():
	$Menu/Pause.pause_mode = PAUSE_MODE_PROCESS

# Set HUD text
func _process(delta):
	$HUD/GameTimer/Label.text = get_time()
	
func _physics_process(delta):
	$Menu/Pause.pause_mode = PAUSE_MODE_PROCESS
	
func _on_WumpusSpawnTimer_timeout():
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position
	
	$WumpusSpawn.position = position
	add_child(wumpus)
	# Wumpus position has to be set here to remove the bug of it spawning at the origin
	wumpus.position = $WumpusSpawn.position
	
func _on_GameTimer_timeout():
	get_tree().quit()

# Time getter
func get_time():
	var current_time = OS.get_ticks_msec()
	var minutes = current_time / 1000 / 60
	var seconds = current_time / 1000 % 60
	var msec = current_time % 1000 / 10
	
	if minutes < 10:
		minutes = "0" + str(minutes)
	if seconds < 10:
		seconds = "0" + str(seconds)
	if msec == 0:
		msec = "00"
	else:
		msec = "0" + str(msec)
	
	return str(minutes) + " " + str(seconds) + " " + str(msec)
