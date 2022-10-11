extends Area2D


func _on_Orb_area_entered(area):
	$AnimationPlayer.play("Collected")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Collected":
		.queue_free()

