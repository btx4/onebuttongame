extends PathFollow2D

var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta  # Move along the path


func _on_enemy_ship_area_entered(area: Area2D) -> void:
	print("Collision")
	if area.is_in_group("ship"):
		area.stop()
	pass # Replace with function body.
