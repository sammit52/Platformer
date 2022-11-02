extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),(value/5)-0.75)
