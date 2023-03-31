extends Camera2D

export var moveauth = false
var delta = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	smoothing_enabled = false

func _process(delta):
	if moveauth == true:
		if Input.is_key_pressed(KEY_O):
			smoothing_enabled = true
			position.y = 0
			position.x = 0
			$delta.start()
		if position.x >= -510 and position.x < 510 and position.y >= -300 and position.y < 300:
			if Input.is_key_pressed(KEY_J):
				position.x = position.x - 10
			elif Input.is_key_pressed(KEY_K):
				position.y = position.y + 10
			elif Input.is_key_pressed(KEY_L):
				position.x = position.x + 10
			elif Input.is_key_pressed(KEY_I):
				position.y = position.y - 10
		else:
			smoothing_enabled = true
			position.y = 0
			position.x = 0
			$delta.start()




func _on_delta_timeout():
	smoothing_enabled = false
