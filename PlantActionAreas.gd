extends Area2D


var canInteract :=false


func _on_PlantActionAreas_body_entered(body: Node) -> void:
	if body.name == "Player":
		canInteract = true


func _on_PlantActionAreas_body_exited(body: Node) -> void:
	if body.name == "Player":
		canInteract = false
