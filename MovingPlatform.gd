extends Node2D
export (int) var follow_speed = 40

func _process(delta):
	$Path2D/PathFollow2D.offset += follow_speed * delta


func _ready():
	pass
