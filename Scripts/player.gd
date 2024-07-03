extends CharacterBody2D


const SPEED = 150.0
const ACCEL = 10
const DEACCEL = 30
const JUMP_VELOCITY = -400.0

var current_acceleration = ACCEL
var move_in = "right"

@onready var animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	for i in range(get_child_count()):
		print(get_child(i))

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
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
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
