extends Node

const PLAY_TIME = 18
var timer_label = null

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_label = get_node("AttackGui/Time")
	$Timer.wait_time = PLAY_TIME
	spawn_character() 
	print("ready")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_left = $Timer.time_left
	timer_label.set_text("Time: {time}".format({"time":time_left}))

func _on_tree_area_1_input_event(viewport, event, shape_idx):
	#Prevents from calling the signal twice for double click
	if event is InputEventMouseButton && Input.is_action_just_released("select"):
		var player = get_node("Character")
		player.position = $TreeMarker1.position
		print("To tree 1")
		

func _on_tree_area_2_input_event(viewport, event, shape_idx):
	#Prevents from calling the signal twice for double click
	if event is InputEventMouseButton && Input.is_action_just_released("select"):
		var player = get_node("Character")
		player.position = $TreeMarker2.position
		print("To tree 2")
		

func _on_tree_area_3_input_event(viewport, event, shape_idx):
	#Prevents from calling the signal twice for double click
	if event is InputEventMouseButton && Input.is_action_just_released("select"):
		var player = get_node("Character")
		player.position = $TreeMarker3.position
		print("To tree 3")

func _on_tree_area_4_input_event(viewport, event, shape_idx):
	#Prevents from calling the signal twice for double click
	if event is InputEventMouseButton && Input.is_action_just_released("select"):
		var player = get_node("Character")
		player.position = $TreeMarker4.position
		print("To tree 4")

func spawn_character():
	var player = get_node("Character")
	player.position = Vector2(304 / 2, 496 / 2)
	player.show()
	print(player.position)

func _on_timer_timeout():
	pass # Replace with function body.
