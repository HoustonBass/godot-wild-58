extends RigidBody2D

const SPEED = -300

func _ready():
	self.linear_velocity.x = SPEED


func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
