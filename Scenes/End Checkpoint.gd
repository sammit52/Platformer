extends Node2D


func _ready():
	pass


func _on_Area2D_area_entered(area):
	$AnimationPlayer.play("Checkpoint")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Checkpoint":
		$AnimationPlayer.play("Idle")
	elif anim_name == "Idle":
		get_tree().change_scene("res://End Scene.tscn")

