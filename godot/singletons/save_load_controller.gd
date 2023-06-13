extends Node

var user_file = "user://game_config.cfg"
var config = ConfigFile.new()
var gameConfig: GameConfig = GameConfig.new()

func _ready():
	var err = config.load(user_file)
	if err != OK:
		push_warning("Could not load config, falling back to default values")
	
	for keyStr in GameConfig.ConfigKeys.keys():
		var key = GameConfig.ConfigKeys[keyStr]
		var value = config.get_value("Game Config", str(key), GameConfig.defaults[key])
		gameConfig.set_value(key, value)
	

func update_config(key: GameConfig.ConfigKeys, value):
	gameConfig.set_value(key, value)
	config.set_value("Game Config", str(key), value)
	var err = config.save(user_file)
	if err != OK:
		print(err)

func get_config(key: GameConfig.ConfigKeys):
	return gameConfig.values[key]
