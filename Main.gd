extends Node

func _ready():
	$Player.connect("hitPinata",self,"onPinataHit")
	$Player.connect("hitWorker",self, "playGrunt")
	$Player.connect("hitChair",self, "playChair")
	$Player.connect("hitWall",self, "playBump")
	$Player.connect("collide", self, "playBump")
	
	
func onPinataHit():
	playYay()
	Global.goto_scene("res://Level2.tscn")

func playYay():
	$sfx.play("yay")

func playGrunt():
	$sfx.play("grunt")

func playChair():
	$sfx.play("chair_spin")
	
func playBump():
	$sfx.play("bump")