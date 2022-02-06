extends Node2D

onready var plants : Array = $YSort/Plants.get_children()
onready var birds : Array = $BirdStartLocations.get_children()

onready var birdSpawner = $BirdSpawner
onready var birdsOnPlants : Array = []


func _ready() -> void:
	birdSpawner.connect("getPlantLocations", self, "getPlantLocations")
	birdSpawner.connect("getBirdStartLocations", self, "getBirdStartLocations")
	birdSpawner.connect("birdLanded", self, "checkForOverlappingBirds")


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
	pass

	
