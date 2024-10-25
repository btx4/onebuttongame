extends PathFollow2D

var speed = 100
var reversed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:    
	if reversed:
		progress -= speed * delta  # Move in reverse
		if progress_ratio == 0:
			reversed = !reversed
		
	else:
		progress += speed * delta  # Move forward
		if progress_ratio == 1:
			reversed = !reversed


func _on_enemy_ship_area_entered(area: Area2D) -> void:
	print("Collision")
	if area.is_in_group("ship"):
		area.stop()
	pass # Replace with function body.
