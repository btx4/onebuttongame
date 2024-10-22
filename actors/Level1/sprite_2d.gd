extends Sprite2D

# Called when the node enters the scene tree for the first time
func _ready():
	start_animation()

# Function to start the animation
func start_animation():
	# Create a SceneTreeTween to animate the sprite
	var tween = create_tween()

	# Define the target scales
	var shrink_scale = Vector2(9, 9)
	var grow_scale = Vector2(10, 10)

	# Define the duration for each animation
	var duration = 4  # seconds
	# Animate the sprite shrinking
	tween.tween_property(self, "scale", shrink_scale, duration)

	# After shrinking, animate the sprite growing
	tween.tween_property(self, "scale", grow_scale, duration)

	# Chain the animation to continuously repeat
	tween.tween_callback(Callable(self, "start_animation"))
