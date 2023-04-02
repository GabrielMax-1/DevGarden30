extends Node2D

export var dataload = ""
export var datasave = ""



export var activate = false
export var use_collision2d = false

func loadData(name, var_to_load_data):
	
	var save = File.new()
	if(save.file_exists("user://" + name + ".dat")):
		save.open("user://" + name + ".dat", File.READ)
		
		var_to_load_data = save.get_var()
		
		print("Readed Data:")
		
		
	else:
		
		print("Error, The path dont exist")


func saveData(var_to_save_data, name):
	var save = File.new()
		
	save.open("user://" + name + ".dat", File.WRITE)
	
	save.store_var(var_to_save_data)
		
	save.close()
		
	return;
		
	print("Stored data:")
	
	loadData("userdat", dataload)
	
		




# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if activate == true:
		saveData(datasave, "userdat")


func _on_Area2D_body_entered(body):
	if use_collision2d == true:
		activate = true
