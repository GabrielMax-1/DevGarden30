extends KinematicBody2D
 
export var ACCELERATION = .1
export var MAX_SPEED = 300
export var JUMP_H = -900
export var UP = Vector2(0, -1)
export var gravity = 40
export var is_dead = false
export var time2move = true
var anim
export var coins = 0
export var lives = 0


onready var sprite = $Sprite
onready var animationPlayer = $AnimatedSprite
 
var motion = Vector2()
 
func _physics_process(delta):
	if time2move == true:
		if motion.x == 0:
			anim = 0
		if motion.x == -10:
			anim = 0
		if motion.x == 250:
			anim = 0
		if motion.x == -250:
			anim = 0
		if motion.x == 255:
			anim = 1
		if motion.x == -255:
			anim  = 1
		if motion.x == 490:
			anim = 1
		if motion.x == -490:
			anim = 1
		if motion.x == 495:
			anim = 2
		if motion.x == -495:
			anim = 2
			
		$Label.text = String(motion.x)
		# apply gravity to the player
		motion.y += gravity
		var friction = false
	 

		if Input.is_action_pressed("ui_down"):
			motion.x = motion.x / 1.5
		if Input.is_action_pressed("ui_right"):
			animationPlayer.flip_h = false
			match anim:
				0:
					animationPlayer.play("Walk")
				1:
					animationPlayer.play("Run")
				2:
					animationPlayer.play("RunFaster")
			motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		elif Input.is_action_pressed("ui_left"):
			match anim:
				0:
					animationPlayer.play("Walk")
				1:
					animationPlayer.play("Run")
				2:
					animationPlayer.play("RunFaster")
			animationPlayer.flip_h = true
			motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		else:
			animationPlayer.play("Idle")
			friction = true
	 
		if is_on_floor():
	 
			if Input.is_action_just_pressed("ui_up"):
				motion.y = JUMP_H
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.5)
		else:
			animationPlayer.play("Fall")
			if friction == true:
				motion.x = lerp(motion.x, 0, 0.01)
	 
		motion = move_and_slide(motion, UP)
	 


	if is_dead == true:
		time2move = false
		$AnimatedSprite.play("Dead")

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Dead":
		is_dead = false
		time2move = true
