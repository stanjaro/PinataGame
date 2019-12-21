extends CanvasLayer

signal start_game
var timeLeft = 120

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


func _on_TimeOnLevel_timeout():
	timeLeft-=1
	show_message(String(timeLeft) + " s")
