extends Control

var runTime : float
var minutes
var seconds


func _ready() -> void:
	calculateTotalTime()
	var string = "It lasted for %s minutes and %s seconds."
	var filledString = string % [minutes, seconds]
	$TimeLabel.text = filledString


func calculateTotalTime() -> float:
	var runTimeInSeconds = Time.getGlobalEndTime() - Time.getGlobalStartTime()
#	minutes = runTimeInSeconds / 60
#	seconds = runTimeInSeconds - minutes
	minutes = runTimeInSeconds / 60
	seconds = runTimeInSeconds % 60
	return runTime


func _on_RestartButton_pressed() -> void:
	get_tree().change_scene("res://Farm.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
