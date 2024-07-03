

var name
var id
var size
var texture
var hidden
	
func _init(_name,_id,_size,_texture = _id, _hidden = false):
	name = _name
	id = _id
	size = _size
	hidden = _hidden
	texture = load("res://Assets/Sprites/Buildings/"+ self.id + ".png")
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
