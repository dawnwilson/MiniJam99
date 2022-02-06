extends Node2D

onready var plants : Array = $YSort/Plants.get_children()
onready var birds : Array = $BirdStartLocations.get_children()

onready var birdSpawner = $BirdSpawner
onready var birdsOnPlants : Array = []
var plantPopulation : int


func _ready() -> void:
	birdSpawner.connect("startMusic", self, "startMusic")
	birdSpawner.connect("gameTime", self, "setStartTime")
	birdSpawner.connect("getPlantLocations", self, "getPlantLocations")
	birdSpawner.connect("getBirdStartLocations", self, "getBirdStartLocations")
	birdSpawner.connect("birdLanded", self, "checkForOverlappingBirds")
	plantPopulation = plants.size() -1


func setStartTime() -> void:
	var startTime = OS.get_unix_time()
	Time.setGlobalStartTime(startTime)


func getPlantLocations() -> void:
	for plant in plants:
		var plantLocation : Vector2 = plant.position
		birdSpawner.plantLocations.push_back(plantLocation)


func getBirdStartLocations() -> void:
	for birdPos in birds:
		var pos : Vector2 = birdPos.position
		birdSpawner.birdStartLocations.push_back(pos)


func checkForOverlappingBirds(newBird : Bird) -> void:
	#TODO: bird move if on another bird
	#if bird isn't overlapping:
	newBird.eating()


func onPlantDeath() -> void:
	if plantPopulation > 1:
		plantPopulation -= 1
	else:
		setEndTime()
		get_tree().change_scene("res://EndScreen.tscn")


func setEndTime() -> void:
	var endTime = OS.get_unix_time()
	Time.setGlobalEndTime(endTime)


func startMusic() -> void:
	$AudioStreamPlayer.play()
