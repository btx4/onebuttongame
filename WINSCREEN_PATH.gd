extends PathFollow2D

@export var speed: float = 150.0  # Speed of movement
var moving = false;

func _process(delta: float) -> void:
	progress += speed * delta  # Move along the path
