extends Sprite2D

var cannon_scene = preload("res://actors/Level1/cannon.tscn")  # Preload the cannon scene
var timer
var ammo = 3
var canFire
var buttonPress = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	canFire = true
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and canFire == true and ammo > 0:  # Detects spacebar press
		if(buttonPress !=0):
			buttonPress = 1
			$CannonLAnimation.play("CannonFire")
			timer = get_tree().create_timer(1)
			if(canFire == true):
				fire()
		buttonPress = 1
		
		

func fire() -> void:
	canFire = false
	ammo = ammo - 1
	await timer.timeout
	var cannon_instance = cannon_scene.instantiate()  # Create a new instance of the Cannon scene
	var tip_position = $Tip.global_position
	var toe_position = $toe.global_position
	# Calculate the direction vector from Tip to Toe
	cannon_instance.direction = (tip_position - toe_position).normalized()
	cannon_instance.global_position = global_position 

	get_tree().root.add_child(cannon_instance)  # Add the new instance to the scene tree
	if(get_tree().get_nodes_in_group("level")[0].get_node("ammoBar")):
		(get_tree().get_nodes_in_group("level")[0].get_node("ammoBar")).current_ammo = ammo
		(get_tree().get_nodes_in_group("level")[0].get_node("ammoBar")).update_ammo_display()
		get_tree().get_nodes_in_group("level")[0].start_screenshake(.25,5)
	#print(get_tree().root.get_children())
	#print(get_tree().root.get_child(0).get_children())
	$reloadTimer.start()
	


func _on_reload_timer_timeout() -> void:
	print("RESET")
	canFire = true
	pass # Replace with function body.
