extends Area2D

var direction = Vector2(1, 0)  # Set to the desired direction (e.g., right)
var speed = 350  # Movement speed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(global_position)
	pass

# Called every physics frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	# Calculate velocity based on direction and speed
	var velocity = direction.normalized() * speed
	
	position += velocity * delta
	
	scale = Vector2(10,10)
