extends CharacterBody2D

const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 400
var water_gravity = 600
const MAX_FALL_SPEED = 200
const FLAP = 200
const MAX_ROTATION = -PI/ 4;
var angular_velocity = 0;

signal died

func _physics_process(delta):
	# Add the gravity
	velocity.y += gravity * delta

	# Handle Jump.
	if velocity.y > MAX_FALL_SPEED:
		velocity.y = MAX_FALL_SPEED
	if Input.is_action_just_pressed("jump"):
		velocity.y = -FLAP
		angular_velocity -= PI 
		$JumpSound.play()

	if rotation <= MAX_ROTATION :
		rotation = MAX_ROTATION
		angular_velocity = 0
	
	if velocity.y > 0:
		if rotation <= 0:
			angular_velocity = PI / 2
		else:
			angular_velocity = 0
	
	rotation += angular_velocity * delta
	move_and_slide()

func _ready():
	$AnimatedSprite2D.play("flapping")

func _on_hitbox_body_entered(body):
	if body.is_in_group("enemy"):
		died.emit()
		
		
