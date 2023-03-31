extends Area2D

onready var spr = $AnimatedSprite
onready var audio = $AudioStreamPlayer2D

func _ready():
	pass

func _on_AnimatedSprite_animation_finished():
	spr.play("default")

func _on_Area2D_body_entered(area):
	if area.is_in_group("player"):
		audio.play()
		spr.visible = false
		$Timer.start()
		
	else:
		print("A Body touch the money, but isnt the player")



func _on_Timer_timeout():
	queue_free()
