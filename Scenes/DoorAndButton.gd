extends Node2D
var dooropen = false

func close_doors():
	dooropen = false
	


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		if dooropen == false:
			dooropen = true
			$AnimationPlayer.play("DoorOpen")
		

