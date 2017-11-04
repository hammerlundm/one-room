extends KinematicBody2D

#Variables that can be changed
var G = Vector2(0.0, 1.0)
var SPEED = 1.0
var JUMP_HEIGHT = 1.0
var FRICTION = 1.0

#other variables
var v = Vector2(0, 0)
var a = Vector2(0, 0)
export(float) var SPEED_FACTOR = 150.0
export(float) var FRICTION_FACTOR = 5.0
export(float) var GRAVITY_FACTOR = 10.0
export(float) var JUMP_FACTOR = 10.0
var effect = null

func apply():
	pass

func _ready():
	set_fixed_process(true)
	apply()

func do_friction(delta):
	var f = pow(0.5, FRICTION * FRICTION_FACTOR * delta)
	v.x *= f
	a.x *= f*f

func update_pos(delta):
	v += a * delta
	move(v)

func do_gravity(delta):
	v += G * GRAVITY_FACTOR * delta

func get_input(delta):
	if Input.is_action_pressed("ui_left"):
		a.x -= SPEED * SPEED_FACTOR * delta
	if Input.is_action_pressed("ui_right"):
		a.x += SPEED * SPEED_FACTOR * delta
	if Input.is_action_pressed("ui_select") and is_colliding() and abs(get_collision_normal().y + 1) < 0.01:
		v.y -= JUMP_HEIGHT * JUMP_FACTOR

func unstick(delta):
	if is_colliding():
		var normal = get_collision_normal()
		v -= v.dot(normal) * normal

func _fixed_process(delta):
	update_pos(delta)
	do_friction(delta)
	do_gravity(delta)
	unstick(delta)
	get_input(delta)
