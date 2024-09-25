extends Control

func _on_play_pressed(): #this is the play button, when pressed it will iniate the game
	get_tree().change_scene_to_file("res://Scenes/world.tscn")


func _on_quit_pressed(): #this is the quit button, when pressed it will quit the game
	get_tree().quit()
