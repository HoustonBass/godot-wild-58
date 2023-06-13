extends Object
class_name GameConfig

enum ConfigKeys { 
	#gameplay
	
	#music
	MUSIC_VOLUME, SFX_VOLUME, MASTER_VOLUME
}

static var defaults = {
	ConfigKeys.MUSIC_VOLUME: 100,
	ConfigKeys.SFX_VOLUME: 100,
	ConfigKeys.MASTER_VOLUME: 100
}

var values = {}

func set_value(key: ConfigKeys, value):
	match(key):
		ConfigKeys.MASTER_VOLUME:
			var scaledVolume = linear_to_db(value/100)
			AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), scaledVolume)
		_:
			print("did not handle change in key: " + str(key))
	values[key] = value
