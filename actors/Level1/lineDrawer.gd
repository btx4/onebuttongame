extends Path2D

# Reference to the Line2D node
@onready var line = $Line2D

# This function updates the Line2D to follow the Path2D curve
func _ready():
	update_line()

# Function to update Line2D points based on Path2D curve
func update_line():
	var curve = self.curve  # Get the Curve2D of Path2D
	line.clear_points()  # Clear any existing points in Line2D
	
	# Get baked points directly from the curve
	var baked_points = curve.get_baked_points()
	
	for point in baked_points:
		line.add_point(point)
