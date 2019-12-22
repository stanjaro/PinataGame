extends Node

func _ready():
	$Player.connect("hitPinata",self,"onPinataHit")
	$Player.connect("hitWorker",self, "playGrunt")
	$Player.connect("hitWorker",$HUD,"timePenalty")
	$Player.connect("hitChair",self, "playChair")
	$Player.connect("hitWall",self, "playBump")
	$Player.connect("collide", self, "playBump")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	

func game_over():
	$HUD/TimeCD.stop()
	$HUD.show_game_over()

func new_game():
	$HUD.show_message("Hit the Pinata with your bat")
	
func onPinataHit():
	playYay()
	Global.goto_scene("res://Level2.tscn")


func playYay():
	sfx.play("yay")

func playGrunt():
	sfx.play("grunt")

func playChair():
	sfx.play("chair_spin")
	
func playBump():
	sfx.play("bump")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("ui_select"):
        Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)