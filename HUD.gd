extends CanvasLayer

signal start_game
var timeLeft = 125

func _ready():
	$TutInstruc.hide()
	$BackToMenu.hide()
	

func show_message(text):
	$TimeCD.text = text
	$TimeCD.show()
	$TimeOnLevel.start()

func show_game_over():
	show_message("Game Over")
	yield($TimeOnLevel, "timeout")
	$TimeCD.text = "Find the Pinata Faster"
	$TimeCD.show()
	$StartButton.show()

func _on_StartButton_pressed():
	$StartButton.hide()
	show_message(String(timeLeft) + " s")
	emit_signal("start_game")
	Global.goto_scene("res://Level1.tscn")


func _on_TimeOnLevel_timeout():
	timeLeft-=1
	show_message(String(timeLeft) + " s")

func timePenalty():
	timeLeft-=2
	show_message(String(timeLeft) + " s")

func _on_Tutorial_pressed():
	$TutInstruc.show()
	$Tutorial.hide()
	$BackToMenu.show()
	$StartButton.hide()


func _on_BackToMenu_pressed():
	$TutInstruc.hide()
	$Tutorial.show()
	$StartButton.show()
	$BackToMenu.hide()
