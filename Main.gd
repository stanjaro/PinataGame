extends Node

func _ready():
	$Player.connect("collidePinata",self,"onPinataHit")
	
	
	
func onPinataHit():
	Global.goto_scene("res://Level2.tscn")