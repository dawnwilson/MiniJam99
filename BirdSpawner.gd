extends Node

var bird = preload("res://Bird.tscn")

signal getPlantLocations
signal getBirdStartLocations
signal birdLanded

var plantLocations : Array = []
var birdStartLocations : Array = []

var randomNum = RandomNumberGenerator.new()
onready var tween = $Tween


func _ready() -> void:
	$SpawnBirdTimer.wait_time = 10


func pickRandomStartLocation() -> Vector2:
	randomNum.randomize()
	var index = randomNum.randi_range(0, birdStartLocations.size() - 1)
	var startPosition = birdStartLocations[index]
	return startPosition


func pickRandomPlantLocation() -> Vector2:
	randomNum.randomize()
	var index = randomNum.randi_range(0, plantLocations.size() - 1)
	var endPosition = plantLocations[index]
	return endPosition


func _on_Spawn_Bird_Timer() -> void:
	var newBird = bird.instance()
	var startPosition = pickRandomStartLocation()
	var endPosition = pickRandomPlantLocation()
	newBird.position = startPosition
	$Birds.add_child(newBird)
	flyToPlant(startPosition, endPosition, newBird)


func flyToPlant(startPosition : Vector2, plantPosition : Vector2, newBird) -> void:
	tween.interpolate_property(newBird, "position",
		startPosition, plantPosition, 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()


func _on_OverallTimer_timeout() -> void:
	if $SpawnBirdTimer.wait_time == 1:
		$SpawnBirdTimer.wait_time -= 1
		print($SpawnBirdTimer.wait_time)
	else:
		print("Fast as Possible")
	# decrease bird spawn timer


func _on_Play_Button_pressed() -> void:
	$Button.queue_free()
	emit_signal("getBirdStartLocations")
	emit_signal("getPlantLocations")
	$SpawnBirdTimer.wait_time = 10
	$SpawnBirdTimer.start()
	$OverallTimer.start()


func _on_Tween_tween_completed(newBird: Object, key: NodePath) -> void:
	emit_signal("birdLanded", newBird)
	
	pass # Replace with function body.

