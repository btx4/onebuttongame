extends PathFollow2D

@export var speed: float = 150.0  # Speed of movement
var moving = false;

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		$WaterSplash.play()
		moving = true
		
	if moving == true:
		progress += speed * delta  # Move along the path
	if progress_ratio == 1:  # If normalized, or use path length if unnormalized
		get_parent().get_parent().game_is_over()
