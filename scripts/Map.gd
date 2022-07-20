extends Node

var wumpus_scene = load("res://scenes/Wumpus.tscn")

func _ready():
	var wumpus = wumpus_scene.instance()
	
	add_child(wumpus)
	
	# Gets Nodes with any group with "spawn"
	var spawn_nodes = get_tree().get_nodes_in_group("spawn")
	# Randomisation calculations for each index in the array of spawn nodes
	var spawn_node = spawn_nodes[randi() % spawn_nodes.size()]
	var position = spawn_node.position
	
	# Conclusively set the position of the spawn point
	$Spawn.position = position
	# Wumpus position has to be set here to remove the positional error of being placed at the origin
	wumpus.position = $Spawn.position
