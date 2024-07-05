extends Node

# Different select modes
enum selectMode {BUILDING, SELECTING, INVENTORY}

# Building List
var Buildings

# What mode it starts in
var mode = selectMode.BUILDING

# previous gui mode

# Called when the node enters the scene tree for the first time.
func _ready():
	# building index
	#region id : constructor(name,id,size)
	Buildings = {
		#"sigma":Building.new("TestBuilding","sigma",Vector2(1,1))
	}
	#endregion


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

