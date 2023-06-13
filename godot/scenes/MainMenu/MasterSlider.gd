extends HBoxContainer

func _ready():
	var value = SaveLoadController.get_config(GameConfig.ConfigKeys.MASTER_VOLUME)
	$MasterVolumeLabel.text = str(value)
	$MasterVolumeSlider.value = value

func _on_master_volume_slider_value_changed(value: float):
	$MasterVolumeLabel.text = str(int(value))


func _on_master_volume_slider_drag_ended(value_changed):
	if value_changed:
		print("Saving value!")
		SaveLoadController.update_config(GameConfig.ConfigKeys.MASTER_VOLUME, $MasterVolumeSlider.value)
