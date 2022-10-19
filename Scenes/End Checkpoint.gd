extends Node2D

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://EndScene.tscn")


func _on_Area2D_area_entered(area):
	if area.is_in_group("Player"):
		get_tree().change_scene("res://EndScene.tscn")
