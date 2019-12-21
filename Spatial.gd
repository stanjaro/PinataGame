extends Spatial

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if event.is_action_pressed("ui_select"):
        Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
