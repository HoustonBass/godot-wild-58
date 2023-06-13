extends CharacterBody2D

const SPEED = 300.0
const GLIDE_VELOCITY = 125.0
const JUMP_VELOCITY = -400.0

var jumpHeld = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 980
var water_gravity = 600

signal died

func _physics_process(delta):
	# Add the gravity
	velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		jumpHeld = true
	if Input.is_action_just_released("jump"):
		jumpHeld = false
	if jumpHeld and velocity.y > GLIDE_VELOCITY:
		velocity.y = GLIDE_VELOCITY

	#move_and_slide()
	
	# todo tune this
	var tilt = ((clamp(abs(velocity.y) - abs(velocity.x), -400, 400)/400) + 1) / 2
	var min_angle = deg_to_rad(-25.0)
	var max_angle = deg_to_rad(30.0)
	rotation = lerp_angle(min_angle, max_angle, tilt)


func _on_hitbox_body_entered(body):
	if body.is_in_group("enemy"):
		died.emit()
		$AnimationPlayer.play("die")
		
		
