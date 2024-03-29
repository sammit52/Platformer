extends Node2D


func _ready():
	GameStats.reset_timer()
	
func _process(delta):
	$UI/Control2/Label.text = GameStats.get_points()
	if Input.is_action_just_pressed("reset"):
		GameStats.reset()
	$UI/Control/Label.text = GameStats.get_time()
	#print(GameStats.get_time())

func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		print("Player Dead")
		if GameStats.check_reset() == false:
			body.global_position = GameStats.get_spawn().global_position

