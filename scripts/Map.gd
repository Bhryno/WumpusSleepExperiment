extends Node2D

var wumpus_scene = preload("res://scenes/Wumpus.tscn")

var wumpus = wumpus_scene.instance()

func _process(delta):
	$GameTimerLayer/Control/Timer.text = "test"

func _on_WumpusSpawnTimer_timeout():
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position
	
	$WumpusSpawn.position = position
	add_child(wumpus)
	wumpus.position = $WumpusSpawn.position
