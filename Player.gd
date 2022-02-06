extends KinematicBody2D

export var speed := 200
onready var anim := $AnimationPlayer

var velocity = Vector2()

func getInput():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	if velocity.x != 0 || velocity.y != 0:
		anim.play("Walk")
	else:
		anim.play("idle")
	getInput()
	velocity = move_and_slide(velocity)
