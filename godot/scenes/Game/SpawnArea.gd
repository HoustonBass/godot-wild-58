extends Marker2D

@onready var cloud = preload("res://scenes/Enemies/Cloud/cloud.tscn")

func _on_timer_timeout():
	var newCloud = cloud.instantiate()
	var x = lerp(0, 200, randf())
	var y = lerp(0, 600, randf())
	newCloud.position.x = self.position.x + x
	newCloud.position.y = self.position.y - y
	self.get_parent().add_child(newCloud)
