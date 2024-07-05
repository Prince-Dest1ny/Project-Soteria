class_name Building extends Area2D

var id
var size
var texture
	
func _init(_name,_id,_size,_texture = _id):
	name = _name
	id = _id
	size = _size as Vector2
	texture = load("res://Assets/Sprites/Buildings/"+ self.id + ".png")
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
