extends MarginContainer

# ">" selectors
onready var selector_1 = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector

# Current selection index
var current_selection = 0

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

func _input(event):
	if event.is_action_pressed("Pause"):
		var new_pause_state = not get_tree().paused
		
		get_tree().paused = new_pause_state
		
		visible = new_pause_state

# Default states for selectors
func set_current_selection(_current_selecton):
	selector_1.text = ""
	
	if _current_selecton == 0:
		selector_1.text = ">"

# Events for selectors and their performed actions
func handle_selection(_current_selection):
	if _current_selection == 0:
		get_tree().quit()
