extends Node

func play(sfx = null):
	if sfx:
		get_node(sfx).play()
	else:
		return