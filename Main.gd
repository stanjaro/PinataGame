extends Node

func _ready():
	$Player.connect("hitPinata",self,"onPinataHit")
	
	
	
func onPinataHit():
	Global.goto_scene("res://Level2.tscn")