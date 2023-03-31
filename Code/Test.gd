extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if $"ᴬCheckpoint2".active == true:
		$"ᴬCheckpoint".active = false
	elif $"ᴬCheckpoint".active == true:
		$"ᴬCheckpoint2".active = false

	
	if $KinematicBody2D.is_dead == true:
		if $"ᴬCheckpoint".active == true:
			$KinematicBody2D.position.x = $"ᴬCheckpoint".position.x
			$KinematicBody2D.position.y = $"ᴬCheckpoint".position.y
		elif $"ᴬCheckpoint2".active == true:
			$"ᴬCheckpoint".active = false
			$KinematicBody2D.position.x = $"ᴬCheckpoint2".position.x
			$KinematicBody2D.position.y = $"ᴬCheckpoint2".position.y
