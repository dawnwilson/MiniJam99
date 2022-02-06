extends Node

var globalTimeStart := 0 setget setGlobalStartTime, getGlobalStartTime
var globalTimeEnd := 0 setget setGlobalEndTime, getGlobalEndTime


func setGlobalStartTime(time) -> void:
	globalTimeStart = time

func getGlobalStartTime() -> int:
	return globalTimeStart

func setGlobalEndTime(time) -> void:
	globalTimeEnd  = time

func getGlobalEndTime() -> int:
	return globalTimeEnd
