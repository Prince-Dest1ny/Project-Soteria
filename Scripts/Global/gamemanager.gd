extends Node

enum selectMode {BUILDING, SELECTING}
var Buildings = {}
# Stuff

# Called when the node enters the scene tree for the first time.
func _ready():
	# building index
	# id : constructor(name,id,size)
	Buildings = {
		"sigma":Building.new("TestBuilding","sigma",Vector2(1,1))
	}
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
