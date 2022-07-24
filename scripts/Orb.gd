extends Node2D

# If an Area2D Node with parent "Player" enters this Area2D, the orb will be picked up
func _on_Area2D_body_entered(body):
	if "Player" in body.name:
		queue_free()
