extends KinematicBody

export (NodePath) var camera

var SFX_COOLDOWN = 3

var max_speed = 8
var mouse_sensitivity = 0.002
var hit_cooldown = SFX_COOLDOWN
var collide_cooldown = SFX_COOLDOWN/3
var hit_pressed = false
var collide_should_sound = true
var sfx_on = false

var current_collide = "none"
signal hitPinata()
signal hitWorker()
signal hitChair()
signal hitWall()
signal collide()

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
	if Input.is_action_pressed("ui_select"):
		check_hit()
	input_dir = input_dir.normalized()
	return input_dir

func set_current_collide(name):
	
	if name.begins_with("Chair"):
		current_collide = "chair"
	elif name.begins_with("Worker"):
		current_collide = "worker"
	elif name.begins_with("Pinata"):
		current_collide = "pinata"
	elif name.begins_with("Wall"):
		current_collide = "wall"
	else:
		current_collide = "none"

func check_hit():
	#print("you hit" + current_collide)
	if current_collide == "chair" and !hit_pressed:
		print("SPIN")
		hit_pressed = true
		
		emit_signal("hitChair")
	elif current_collide == "worker" and !hit_pressed:
		print("OVER THERE")
		hit_pressed = true
		
		emit_signal("hitWorker")
	elif current_collide == "pinata" and !hit_pressed:
		print("YAY")
		emit_signal("hitPinata")
		hit_pressed = true
		
	elif current_collide == "wall" and !hit_pressed:
		print("OOF")
		hit_pressed = true
		
		emit_signal("hitWall")
	else:
		return

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)




func _physics_process(delta):
	var desired_velocity = get_input() * max_speed
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	var collision = move_and_collide(velocity*delta)
	if collision:
		set_current_collide(collision.collider.name)
		if collide_should_sound and sfx_on == false:
			print("collide")
			collide_should_sound = false
			sfx_on = true
			emit_signal("collide")
	else:
		set_current_collide("none")
	if hit_cooldown > 0 and hit_pressed:
		hit_cooldown -= delta
		#print(cooldown)
	if hit_cooldown < 0:
		hit_cooldown = SFX_COOLDOWN
		hit_pressed = false
		
	if collide_cooldown > 0 and !collide_should_sound and sfx_on == true:
		collide_cooldown -= delta
		#print(collide_cooldown)
	if collide_cooldown <= 0:
		collide_cooldown = SFX_COOLDOWN/3
		collide_should_sound = true
		sfx_on = false

