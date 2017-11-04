extends KinematicBody2D

#Variables that can be changed
var G = Vector2(0.0, 1.0)
var SPEED = 1.0
var JUMP_HEIGHT = 1.0
var FRICTION = 1.0

#other variables
var v = Vector2(0, 0)
var a = Vector2(0, 0)
export(float) var SPEED_FACTOR = 100.0
export(float) var FRICTION_FACTOR = 5.0
export(float) var GRAVITY_FACTOR = 5.0
var effect = null

func _ready():
	set_fixed_process(true)

func load_effect(name):
	var effect = load("res://scripts/level_" + name + ".gd").new()
	effect.apply(self)

func update_pos(delta):
	v += a * delta
	var f = pow(0.5, FRICTION * FRICTION_FACTOR * delta)
	v *= f
	a *= f*f
	move(v)

func do_gravity(delta):
	v += G * GRAVITY_FACTOR * delta

func get_input(delta):
	if Input.is_action_pressed("ui_left"):
		a.x -= SPEED * SPEED_FACTOR * delta
	if Input.is_action_pressed("ui_right"):
		a.x += SPEED * SPEED_FACTOR * delta

func _fixed_process(delta):
	update_pos(delta)
	do_gravity(delta)
	get_input(delta)
