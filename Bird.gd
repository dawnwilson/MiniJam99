extends KinematicBody2D




func _ready() -> void:
	$ScareZone.connect("scareBird", self, "scareBird")


func scareBird() -> void:
	queue_free()


