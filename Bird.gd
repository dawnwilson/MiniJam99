extends KinematicBody2D
class_name Bird


func _ready() -> void:
	$CollisionShape2D.disabled = true
	$ScareZone.connect("scareBird", self, "scareBird")


func scareBird() -> void:
	queue_free()


func eating() -> void:
	$EatTimer.start()


func _on_EatTimer_timeout() -> void:
	$CollisionShape2D.disabled = false
