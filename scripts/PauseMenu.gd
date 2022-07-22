extends Control

var is_paused = false setget set_is_paused

const first_scene = preload("res://scenes/MainMenu.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused


func _on_Button_Resume_pressed():
	is_paused = false


func _on_Button_Quit_pressed():
	get_parent().add_child(first_scene.instance())
	queue_free()
