extends Node

onready var game_start_time = OS.get_ticks_msec()
var current_spawn = null
var resetdoors = false

func reset():
	current_spawn = null
	get_tree().reload_current_scene()
	game_start_time = OS.get_ticks_msec()
	resetdoors = false
	
func check_reset():
	var doors = get_tree().get_nodes_in_group(("Door"))
	for d in doors:
		d.close_doors()
	if current_spawn == null:
		reset()
	else:
		return false

func set_spawn(spawn):
	current_spawn = spawn

func get_spawn():
	
	return current_spawn
	

#func get_time():
	#var current_time = OS.get_ticks_msec() - game_start_time
	#var minutes = current_time/1000/60
	#var seconds = current_time/1000%60
	#var ms = current_time%1000/10
	#print(str(minutes),":",str(seconds),":",str(ms))