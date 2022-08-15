extends Node2D
var doorclosed = false

func close_doors():
	
		$AnimationPlayer.play("ButtonDown")
		$AnimationPlayer.play("DoorClosed")

func _ready():
	$AnimationPlayer.play("ButtonUp")
	$AnimationPlayer.play("DoorClosed")
	
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		if doorclosed == false:
			doorclosed = true
			$AnimationPlayer.play("ButtonDown")
			$AnimationPlayer.play("DoorOpen")
		

