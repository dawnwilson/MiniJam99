extends Area2D

var plantFull = load("res://plant_full.png")
var plantHalf = load("res://plant_half.png")
var plantDead = load("res://plant_dead.png")

enum growthStage {FULL, HALF, DEAD}

var plantStage = growthStage.FULL


func _on_Plant_body_entered(body: Node) -> void:
	if body.name == "Player":
		if plantStage == growthStage.FULL:
			plantStage = growthStage.HALF
		elif plantStage == growthStage.HALF:
			plantStage = growthStage.DEAD


func _process(delta: float) -> void:
	if plantStage == growthStage.FULL:
		$Sprite.texture = plantFull
	if plantStage == growthStage.HALF:
		$Sprite.texture = plantHalf
	if plantStage == growthStage.DEAD:
		$Sprite.texture = plantDead
