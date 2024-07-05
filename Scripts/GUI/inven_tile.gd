class_name InvenTile extends Area2D

# to control the sprite
@onready var sprite = $Sprite2D

# Different sprites
const SPRITES = {
	0:preload("res://Assets/Sprites/GUI/inventile_hover.png"),
	1:preload("res://Assets/Sprites/GUI/inventile_empty.png")
	}

# 


func _ready():
	pass

func _mouse_enter():
		sprite.texture = SPRITES[0]

func _mouse_exit():
		sprite.texture = SPRITES[1]

func _on_mouse_entered():
	sprite.texture = SPRITES[0]

func _on_mouse_exited():
	sprite.texture = SPRITES[1]
