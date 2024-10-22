extends Sprite2D

# Declare variables
var timer: Timer

# Called when the node enters the scene tree for the first time
func _ready():
	# Create a Timer node and set the properties
	timer = Timer.new()
	timer.one_shot = true  # The timer will only run once and then stop
	add_child(timer)
	
	# Connect the timer's timeout signal to trigger the animation
	timer.timeout.connect(self.start_animation)
	
	# Start the first timer with a random wait time
	start_random_timer()

# Function to start the timer with a random wait time
func start_random_timer():
	var random_wait_time = randf_range(1.0, 5.0)  # Set random wait time between 1 to 5 seconds
	timer.wait_time = random_wait_time
	timer.start()

# Function to start the animation
func start_animation():
	$AnimationPlayer.play("bubbles")
	start_random_timer()
