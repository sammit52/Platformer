extends KinematicBody2D

export (int) var speed = 120
export (int) var jump_speed = -165
export (int) var gravity = 375
export (int) var slide_speed = 400


var velocity = Vector2.ZERO
var doublejump = true


export (float) var friction = 10
export (float) var acceleration = 25

enum state {IDLE, RUNNING, PUSHING, ROLL, JUMP, STARTJUMP, FALL, ATTACK, WALLJUMP}

onready var player_state = state.IDLE


func _ready():
	$AnimationPlayer.play("Idle")
	pass
	
func update_animation(anim):
	if player_state != state.ROLL:
		if velocity.x < 0:
			$Sprite.flip_h = true
		elif velocity.x > 0:
			$Sprite.flip_h = false
	match(anim):
		state.FALL:
			$AnimationPlayer.play("Fall")
		state.ATTACK:
			$AnimationPlayer.play("Attack")
		state.IDLE:
			$AnimationPlayer.play("Idle")
		state.JUMP:
			$AnimationPlayer.play("Jump")
		state.PUSHING:
			$AnimationPlayer.play("Pushing")
		state.RUNNING:
			$AnimationPlayer.play("Running")
		state.ROLL:
			$AnimationPlayer.play("Roll")
		
	pass
	
func get_input():
	var dir = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if dir != 0:
		velocity.x = move_toward(velocity.x, dir*speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, friction)
		
func handle_state(player_state):
	match(player_state):
		#state.ROLL:
			#velocity.x = 500
			#yield(get_tree().create_timer(1),"timeout")
			#player_state = state.IDLE
		state.STARTJUMP:
			velocity.y = jump_speed
		state.WALLJUMP:
			velocity.y = jump_speed*0.7
			if $Sprite.flip_h == false:
				velocity.x = -175
			else:
				velocity.x = 175
	pass

func _physics_process(delta):
	if player_state != state.ROLL:
		get_input()
		if velocity == Vector2.ZERO:
			player_state = state.IDLE
		if Input.is_action_just_pressed("jump") and is_on_floor():
			player_state = state.STARTJUMP
			doublejump = true
		elif velocity.x != 0:
			player_state = state.RUNNING
		
		#if Input.is_action_just_pressed("roll"):
			#player_state = state.ROLL
			
		if not is_on_floor():
			if velocity.y < 0:
				player_state = state.JUMP
			elif velocity.y > 0:
				player_state = state.FALL
			if Input.is_action_just_pressed("jump") and is_on_wall():
				player_state = state.WALLJUMP
			elif Input.is_action_just_pressed("jump") and doublejump:
				player_state = state.STARTJUMP
				doublejump = false
		
	handle_state(player_state)
	update_animation(player_state)
	
	
	#set gravity
	if is_on_wall() and player_state == state.FALL:
		if gravity <= 100:
			gravity = gravity - 10 * delta
			velocity.y += gravity * delta
		else:
			gravity = 100
			velocity.y += gravity * delta
	else:
		gravity = 375
		velocity.y += gravity * delta
		
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_DeathZone_area_entered(area):
	var points = 0
	if area.is_in_group("Deadly"):
		if GameStats.check_reset() == false:
			global_position = GameStats.get_spawn().global_position
	if area.is_in_group("Points"):
		area.queue_free()
		GameStats.points = GameStats.points + 1
		print(points)
