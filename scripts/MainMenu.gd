extends MarginContainer

# Map scene getter
var first_scene = load("res://scenes/Map.tscn")

# ">" selectors
onready var selector_1 = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector

onready var selector_3 = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector

# Current selection index
var current_selection = 0

# Default initialisation function
func _ready():
	set_current_selection(0)

# Calculations for index increments and decrements
func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)

# Default states for selectors
func set_current_selection(_current_selecton):
	selector_1.text = ""
	selector_3.text = ""
	
	if _current_selecton == 0:
		selector_1.text = ">"
	elif _current_selecton == 1:
		selector_3.text = ">"

# Events for selectors and their performed actions
func handle_selection(_current_selection):
	if _current_selection == 0:
		get_parent().add_child(first_scene.instance())
		queue_free()
	elif _current_selection == 1:
		get_tree().quit()
