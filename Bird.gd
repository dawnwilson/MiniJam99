extends KinematicBody2D
class_name Bird

signal scaredBird

func _ready() -> void:
	$CollisionShape2D.disabled = true
	$ScareZone.connect("scareBird", self, "scareBird")


func scareBird() -> void:
	$PoofTimer.start()
	$Poof.visible = true
	$CollisionShape2D.disabled = true
	$Sprite.visible = false
	$Poof.set_emitting(true)


func eating() -> void:
	$EatTimer.start()


func _on_EatTimer_timeout() -> void:
	$CollisionShape2D.disabled = false


func _on_PoofTimer_timeout() -> void:
	queue_free()
