extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_character()
	print("ready")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_tree_area_1_input_event(viewport, event, shape_idx):
	#Prevents from calling the signal twice for double click
	if event is InputEventMouseButton && Input.is_action_just_released("select"):
		print("To tree 1")
		

func _on_tree_area_2_input_event(viewport, event, shape_idx):
	#Prevents from calling the signal twice for double click
	if event is InputEventMouseButton && Input.is_action_just_released("select"):
		print("To tree 2")
		

func _on_tree_area_3_input_event(viewport, event, shape_idx):
	#Prevents from calling the signal twice for double click
	if event is InputEventMouseButton && Input.is_action_just_released("select"):
		print("To tree 3")


func _on_tree_area_4_input_event(viewport, event, shape_idx):
	#Prevents from calling the signal twice for double click
	if event is InputEventMouseButton && Input.is_action_just_released("select"):
		print("To tree 4")

func spawn_character():
	var player = get_node("Character")
	player.position = Vector2(304 / 2, 496 / 2)
	player.show()
	print(player.position)
