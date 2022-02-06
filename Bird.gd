extends KinematicBody2D
class_name Bird


signal atePlant


func _ready() -> void:
	$CollisionShape2D.disabled = true
	$ScareZone.connect("scareBird", self, "scareBird")


func scareBird() -> void:
	queue_free()


func eating() -> void:
	print("start eat timer")
	$EatTimer.start()


func _on_EatTimer_timeout() -> void:
	print("eat timer up")
	$CollisionShape2D.disabled = false
#	var farm = get_parent().get_parent().get_parent()
	
