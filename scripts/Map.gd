extends Node

var wumpus_scene = load("res://scenes/Wumpus.tscn")

func _ready():
	var wumpus = wumpus_scene.instance()
	
	add_child(wumpus)
	
	var spawn_nodes = get_tree().get_nodes_in_group("spawn")
	var spawn_node = spawn_nodes[randi() % spawn_nodes.size()]
	var position = spawn_node.position
	
	$Spawn.position = position
	wumpus.position = $Spawn.position
