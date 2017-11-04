extends "door.gd"

#Changeable variables
var INIT_POS = Vector2(200, 705)
var SPEED = 1.0
var FRICTION = 1.0

#Other variables
var v = Vector2(0, 0)
var a = Vector2(0, 0)
export(float) var SPEED_FACTOR = 140.0
export(float) var FRICTION_FACTOR = 3.0

#Movement determination
const BASE_MOVE_TIME = 2000
var move_time = BASE_MOVE_TIME
var move_dir = ["right","up","left","down"]
var current_dir = 0

func do_friction(delta):
	var f = pow(0.5, FRICTION * FRICTION_FACTOR * delta)
	v.x *= f
	a.x *= f*f

func update_pos(delta):
	v += a * delta
	move(v)

func unstick(delta):
	if is_colliding():
		var normal = get_collision_normal()
		v -= v.dot(normal) * normal

func apply():
  SPEED = 1.0
  FRICTION = 1.0

func _fixed_process(delta):
  if move_time > 0:
  	if move_dir[current_dir] == "right":
      a.x += SPEED * SPEED_FACTOR * delta
  	elif move_dir[current_dir] == "left":
      a.x -= SPEED * SPEED_FACTOR * delta
  	elif move_dir[current_dir] == "up":
      a.y -= SPEED * SPEED_FACTOR * delta
  	else:
      a.y += SPEED * SPEED_FACTOR * delta
    	move_time -= delta
  else:
    move_time = BASE_MOVE_TIME
    current_dir = (current_dir+1) % 4

  update_pos(delta)
  do_friction(delta)
  unstick(delta)
