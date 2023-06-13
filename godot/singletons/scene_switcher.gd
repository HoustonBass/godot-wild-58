extends Node
var current_scene

func handle_scene_change(next_scene_name: String):
	var next_scene = load(next_scene_name)
	next_scene = next_scene.instantiate()
	
	if current_scene == null:
		for node in get_tree().root.get_children():
			if node.name == "MainMenu":
				current_scene = node
				break
		
	
	current_scene.queue_free()
	add_child(next_scene)
	current_scene = next_scene
