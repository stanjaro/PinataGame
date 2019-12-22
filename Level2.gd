extends Node

func _ready():
	$Player.connect("hitPinata",self,"onPinataHit")
	$Player.connect("hitWorker",self, "playGrunt")
	$Player.connect("hitChair",self, "playChair")
	$Player.connect("hitWall",self, "playBump")
	$Player.connect("collide", self, "playBump")
	HUD.get_node("StartButton").hide()
	HUD.get_node("Tutorial").hide()
	HUD.get_node("Title").hide()
	HUD.show_message("Hit the Pinata with your bat")
	
	
func onPinataHit():
	playYay()
	HUD.get_node("TimeOnLevel").stop()
	HUD.get_node("TimeCD").hide()
	Global.goto_scene("res://youwin.tscn")

func playYay():
	sfx.play("yay")

func playGrunt():
	sfx.play("grunt")

func playChair():
	sfx.play("chair_spin")
	
func playBump():
	sfx.play("bump")