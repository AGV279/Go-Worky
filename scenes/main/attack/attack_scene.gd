extends Node

const PLAY_TIME = 18
var timer_label = null
var apple_in_map = false
var coins = 0
var total_coins = 0
var apple_scene = preload("res://scenes/main/apple/apple_scene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer_label = get_node("AttackGui/Time")
	$Timer.wait_time = PLAY_TIME
	spawn_character() 
	print("ready")
	generate_apple()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_left = $Timer.time_left
	timer_label.set_text("Time: {time}".format({"time":time_left}))
	generate_apple()

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
	total_coins = coins
	pass # Replace with function body.

func generate_apple():
	var generationPoints = [$TreeMarker1, $TreeMarker2, $TreeMarker3, $TreeMarker4]
	for generationPoint in generationPoints:
		if !(generationPoint.position == $Character.position) && !apple_in_map:
			var rng = RandomNumberGenerator.new()
			var rnd_idx = rng.randi_range(0,3)
			var gen_point = generationPoints[rnd_idx]
			print(gen_point.position)
			var apple = apple_scene.instantiate()
			add_child(apple)
			var apple_node = get_node("Apple")
			apple_node.connect("input_event", _on_apple_entered)
			apple.position = gen_point.position
			print(apple.position)
			apple_in_map = true

func _on_apple_entered(viewport, event, shape_idx):
	if event is InputEventMouseButton && Input.is_action_just_released("select"):
		coins += 1
		$AttackGui/CoinsCollected.set_text("Coins: {coins}".format({"coins":coins}))
		var apple = get_node("Apple")
		apple.queue_free()
		apple_in_map = false
		

