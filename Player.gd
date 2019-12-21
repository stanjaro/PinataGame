extends KinematicBody

export (NodePath) var camera

var max_speed = 8
var mouse_sensitivity = 0.002

var current_collide

var velocity = Vector3()

func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("ui_up"):
		input_dir += -get_global_transform().basis.z
	if Input.is_action_pressed("ui_down"):
		input_dir += get_global_transform().basis.z
	if Input.is_action_pressed("ui_left"):
		input_dir += -get_global_transform().basis.x
	if Input.is_action_pressed("ui_right"):
		input_dir += get_global_transform().basis.x
	input_dir = input_dir.normalized()
	return input_dir



func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)




func _physics_process(delta):
	var desired_velocity = get_input() * max_speed
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	var collision_info = get_slide_collision(0)
	if collision_info:
		print(collision_info.collider.get_parent().name)


