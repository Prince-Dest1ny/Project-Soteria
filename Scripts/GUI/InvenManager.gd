class_name InvenManager extends Node2D

@export var size = Vector2i(5,5)
var tilesize = Vector2(18,18)
var tiles = {}
var slots
var tile = preload("res://Scenes/GUI/inven_tile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	slots = $Slots
	
	for i in size.x:
		for j in size.y:
			var tilepos = Vector2(i,j)
			var itemtile = tile.instantiate()
			slots.add_child(itemtile)
			itemtile.set_owner(slots)
			itemtile.name = str("tile",tilepos)
			itemtile.position = tilepos * tilesize - Vector2(size/2) * tilesize
			tiles[tilepos] = itemtile


