extends Control

func _ready():
	$FillerButton.grab_focus()

func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")
	
func _on_OptionsButton_pressed():
	get_tree().change_scene("res://Options.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_StartButton_mouse_entered():
		$Buttons/StartButton.grab_focus()

func _on_OptionsButton_mouse_entered():
		$Buttons/OptionsButton.grab_focus()

func _on_QuitButton_mouse_entered():
		$Buttons/QuitButton.grab_focus()
		
func _on_QuitButton_mouse_exited():
	$FillerButton.grab_focus()

func _on_OptionsButton_mouse_exited():
	$FillerButton.grab_focus()

func _on_StartButton_mouse_exited():
	$FillerButton.grab_focus()
	


