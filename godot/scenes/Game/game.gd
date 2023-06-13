extends Node2D

var concerning_hobbits = load("res://assets/music/concerning-hobbits-lofi.ogg")

var offset

func _ready():
	MusicController.crossfade_to(concerning_hobbits)
	offset = $SpawnArea.position.x

func _process(_delta):
	$CanvasLayer/HBoxContainer/ScoreText.text = str($Player.position.x)
	$SpawnArea.position.x = offset +  $Player.position.x


func _on_player_died():
	get_tree().paused = true
	
