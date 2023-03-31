extends Area2D


# Declare member variables here. Examples:
# var a = 2
export var active = false
export(int, "coins", "lives", "nothing") var gift
export var amount = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Checkpoint_body_entered(area):
	print(area)
	if area.is_in_group("play"):
		print("a")
		if active == false:
			print("Actived")
			active = true
			match gift:
				0:
					area.coins = area.coins + amount
				1: 
					area.lives = area.lives + amount
				2:
					pass
			
