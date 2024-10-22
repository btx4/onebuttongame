extends Control

# Number of bullets available (you can change these dynamically)
var max_ammo = 3
var current_ammo = max_ammo

# The texture for each ammo unit (like a bullet or shell)
@export var ammo_texture: Texture2D  # Assign your ammo texture in the inspector

# Ammo spacing and size
@export var spacing = 10  # Distance between each ammo sprite
@export var ammo_size = Vector2(32, 32)  # The size to draw each ammo texture

# Override the _draw() function to draw custom ammo sprites
func _draw():
	# Draw each ammo sprite based on current_ammo
	for i in range(current_ammo):
		var position = Vector2(i * (ammo_size.x + spacing), 0)
		# Define a destination rectangle to draw the scaled texture
		var dest_rect = Rect2(position, ammo_size)
		# Draw the texture with scaling
		draw_texture_rect(ammo_texture, dest_rect, false)

# Function to update the ammo display when the ammo count changes
func update_ammo_display():
	queue_redraw()  # Triggers the _draw() function to redraw the sprites

func reset():
	current_ammo = max_ammo
