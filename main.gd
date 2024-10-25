extends Node2D
var NUM_TARGETS = 3
var targets



var shake_intensity = 5.0  # How strong the shake is
var shake_duration = 0.5  # How long the shake lasts in seconds
var original_position = Vector2()  # To store the original position before shaking
var shake_timer = 0.0  # Internal timer to track shake duration

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	original_position = position  # Store the original position
	set_process(false)  # Disable process unless shaking
	pass # Replace with function body.

func start_screenshake(duration: float, intensity: float):
	shake_duration = duration
	shake_intensity = intensity
	shake_timer = shake_duration
	set_process(true)  # Enable processing to start shaking

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):  # Detects spacebar press
		get_tree().reload_current_scene()
	
	if shake_timer > 0:
		shake_timer -= delta

		# Apply random offset within the intensity range
		position = original_position + Vector2(
			randf_range(-shake_intensity, shake_intensity),
			randf_range(-shake_intensity, shake_intensity)
		)
	else:
		# Reset position after shaking
		position = original_position
		set_process(false)  # Stop shaking once timer ends
# Called every frame. 'delta' is the elapsed time since the previous frame.


func game_is_over() :
	var targets = get_tree().get_nodes_in_group("target")
	if targets.size() > 0:
		print("MustRetry")
		get_tree().reload_current_scene()
	else:
		print("You Win")
		get_tree().change_scene_to_file("res://level_4.tscn")  # Replace with your scene path
