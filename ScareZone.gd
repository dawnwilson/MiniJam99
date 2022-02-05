extends Area2D

signal scareBird


func _on_ScareZone_body_entered(body: Node) -> void:
	if body.name == "Player":
		emit_signal("scareBird")
