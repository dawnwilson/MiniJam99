extends Control



func _on_PlayButton_pressed() -> void:
	get_tree().change_scene("res://Farm.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
