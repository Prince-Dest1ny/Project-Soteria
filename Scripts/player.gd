extends CharacterBody2D


const ACCEL = 10
const DEACCEL = 30
const JUMP_VELOCITY = -400.0

# To be dynamically changed
var max_speed = 150.0
# for smooth movement idk
var current_acceleration = ACCEL
# animation direction
var move_in = "right"

# Previous mode before inven opened
var prevmode

# For animation
@onready var animated_sprite = $AnimatedSprite2D

# Inventory master node
@onready var inven = $Camera2D/Inventory

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Moving shit
func _physics_process(_delta):
	var direction = Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down"))
	direction = direction.normalized()
		
	# animations idk
	if velocity.x > 0:
			move_in = "right"
	elif velocity.x < 0:
			move_in = "left"
	elif velocity.y > 0:
		move_in = "down"
	elif velocity.y < 0:
		move_in = "up"
	
	match move_in:
		"right":
			if velocity != Vector2(0,0):
				animated_sprite.flip_h = false
				animated_sprite.play("walk_right")
			else:
				animated_sprite.flip_h = false
				animated_sprite.play("idle_right")
		"left":
			if velocity != Vector2(0,0):
				animated_sprite.flip_h = true
				animated_sprite.play("walk_right")
			else:
				animated_sprite.flip_h = true
				animated_sprite.play("idle_right")
		"up":
			if velocity != Vector2(0,0):
				animated_sprite.play("walk_up")
			else:
				animated_sprite.play("idle_up")
		"down":
			if velocity != Vector2(0,0):
				animated_sprite.play("walk_down")
			else:
				animated_sprite.play("idle_down")
		
	
	
		
	# Smooth movement, because why not.
	if direction:
		velocity = direction * max_speed
	else:
		velocity.x = move_toward(velocity.x, 0, max_speed)
		velocity.y = move_toward(velocity.y, 0, max_speed)
		
	#if direction:
	#	if abs(velocity.x) > SPEED:
	#		velocity.x = velocity.x/abs(velocity.x) * SPEED
	#	elif abs(velocity.y) > SPEED:
	#		velocity.y = velocity.y/abs(velocity.y) * SPEED
	#	else:
	#		velocity += abs(SPEED * direction - velocity) * direction * ACCEL/100
	#else:
	#	if velocity.x != 0:
	#		if abs(velocity.x) < DEACCEL:
	#			velocity.x = 0
	#		else:
	#			velocity.x -= DEACCEL * velocity.x/abs(velocity.x)
	#	if velocity.y != 0:
	#		if abs(velocity.y) < DEACCEL:
	#			velocity.y = 0
	#		else:
	#			velocity.y -= DEACCEL * velocity.y/abs(velocity.y)
	move_and_slide()

func _input(event):
	if event.is_action_pressed("inventory"):
			if not inven.visible:
				prevmode = GameManager.mode
				GameManager.mode = GameManager.selectMode.INVENTORY
				max_speed = 70
				inven.visible = true
				inven.process_mode = PROCESS_MODE_INHERIT
			else:
				GameManager.mode = prevmode
				max_speed = 150
				inven.visible = false
				inven.process_mode = PROCESS_MODE_DISABLED
