extends Spatial

export var turn_speed = 2.0
export var move_speed = 10.0
export var break_speed = 1.0
export var acceleration = 10

var vel: Vector3 = Vector3(0,0,0) 
var bomb_time = 100.0

onready var target = $VisualModel/Position3D
onready var phys_body = $PlayerPhysics
onready var visual_mesh = $VisualModel
onready var camera = $Camera

func _physics_process(delta):
	if !GAME.running:
		return
	vel = vel*0.99
	var forward_vector = target.global_transform.origin - phys_body.global_transform.origin 
	var input = 0
	if Input.is_action_pressed("accelerate"):
		input = 1.0
	if Input.is_action_pressed("break"):
		input = -1.0
	forward_vector = forward_vector*input*move_speed*delta
	vel = vel+forward_vector
	vel = phys_body.move_and_slide(vel,Vector3.UP)
	var mag = vel.length()
	if mag < 20:
		bomb_time -= delta*0.5*(20-mag/20)
		$UI/ProgressBar.value = bomb_time
		if bomb_time < 0:
			get_tree().call_group("main", "game_over")
	visual_mesh.global_transform.origin = phys_body.global_transform.origin
	camera.global_transform.origin = Vector3(phys_body.global_transform.origin.x-15,phys_body.global_transform.origin.y + 50,phys_body.global_transform.origin.z)
	if check_left():
		visual_mesh.rotate_y(delta*turn_speed)
	if check_right():
		visual_mesh.rotate_y(-delta*turn_speed)

func check_left() -> bool:
	var keycode = $UI.options[$UI.current_left]
	match keycode:
		"8":
			if Input.is_action_pressed(keycode):
				return true
		"A":
			if Input.is_action_pressed(keycode):
				return true
		"B":
			if Input.is_action_pressed(keycode):
				return true
		"P":
			if Input.is_action_pressed(keycode):
				return true
		"X":
			if Input.is_action_pressed(keycode):
				return true
	return false

func check_right() -> bool:
	var keycode = $UI.options[$UI.current_right]
	match keycode:
		"8":
			if Input.is_action_pressed(keycode):
				return true
		"A":
			if Input.is_action_pressed(keycode):
				return true
		"B":
			if Input.is_action_pressed(keycode):
				return true
		"P":
			if Input.is_action_pressed(keycode):
				return true
		"X":
			if Input.is_action_pressed(keycode):
				return true
	return false

func new_buttons():
	$UI.new_buttons()
