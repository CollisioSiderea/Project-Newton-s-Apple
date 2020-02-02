extends Node


func _ready():
	$MarginContainer/VBoxContainer/TextureRect/VBoxContainer/Start.grab_focus()
	
	
	
func _physics_process(delta):
	if $MarginContainer/VBoxContainer/TextureRect/VBoxContainer/Start.is_hovered() == true:
		$MarginContainer/VBoxContainer/TextureRect/VBoxContainer/Start.grab_focus()
	if $MarginContainer/VBoxContainer/TextureRect/VBoxContainer/Exit.is_hovered() == true:
		$MarginContainer/VBoxContainer/TextureRect/VBoxContainer/Exit.grab_focus()


func _on_Start_pressed():
	get_tree().change_scene("colworld.tscn")


func _on_Exit_pressed():
	get_tree().quit()
