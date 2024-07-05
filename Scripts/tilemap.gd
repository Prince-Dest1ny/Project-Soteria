extends Node2D

# Variables
# Player reference
@onready var player = %Player

@onready var tilemap = $TileMap
# Intialize preview object
var ghost
# Build radius value, in tiles
var build_radius = 5

#Initialise things
# What building to build & display as ghost
var selected_building
# What tile the mouse is over
var selected_tile
# What tile the player is standing on
var player_tile
# The relative coordinates of the selected tile from the player tile
var relative_pos
# the length of the line of relative_pos
var magnitude

func _ready():
	print(%Player)
	player = %Player
	#selected_building = GameManager.Buildings["sigma"]
	ghost = player.get_child(3)
	pass

func _process(_delta):
	# Coordinates of tile in grid coordinates
	selected_tile = tilemap.local_to_map(get_global_mouse_position())
	player_tile = tilemap.local_to_map(player.get_child(1).global_position)
	relative_pos = selected_tile - player_tile
	magnitude = sqrt(relative_pos.x**2 + relative_pos.y**2)
	
	# Moving the ghost around for a cursor and building preview
	ghost.global_position = tilemap.map_to_local(selected_tile)
	
	match GameManager.mode:
		GameManager.selectMode.SELECTING:
			ghost.modulate = Color(1,1,1,0.8)
			ghost.get_child(0).texture = ghost.cursor
			#if magnitude < build_radius:
			#	if selected_tile not in past:
			#		past.append(selected_tile)
			#		set_cell(2,selected_tile,1,Vector2(0,0))
			#		if past.size() > 1:
			#			set_cell(2,past[0])
			#			past.pop_front()
			#else:
			#	for i in past:
			#		set_cell(2,past[0])
			#		past.erase(i)
	
		GameManager.selectMode.BUILDING:
			if selected_building:
				ghost.get_child(0).texture = selected_building.texture
				if magnitude < build_radius:
					ghost.modulate = Color(0.5,1,0.5,0.6)
				else:
					ghost.modulate = Color(1,0.5,0.5,0.6)
			else:
				GameManager.mode = GameManager.selectMode.SELECTING
		GameManager.selectMode.INVENTORY:
			ghost.get_child(0).texture = null
