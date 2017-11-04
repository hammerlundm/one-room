extends "player.gd"

var door_dist
var vol
var music

func get_input(delta):
	if Input.is_action_pressed("ui_left"):
		a.x -= SPEED * SPEED_FACTOR * delta
	if Input.is_action_pressed("ui_right"):
		a.x += SPEED * SPEED_FACTOR * delta
	if Input.is_action_pressed("ui_up"):
		a.y -= SPEED * SPEED_FACTOR * delta
	if Input.is_action_pressed("ui_down"):
		a.y += SPEED * SPEED_FACTOR * delta

func do_friction(delta):
	var f = pow(0.5, FRICTION * FRICTION_FACTOR * delta)
	v *= f
	a *= f*f

func apply():
  G = Vector2(0, 0)
  JUMP_HEIGHT = 0
  sprite.play("jump")

func _ready():
  ._ready()
  music = get_parent().get_node("StreamPlayer")

func _fixed_process(delta):
  ._fixed_process(delta)
  door_dist = self.get_pos().distance_to(Vector2(3000, 3000))
  vol = 1.0/(door_dist/300)
  if vol < 0.1:
    vol = 0.1
  if vol > 1.0:
    vol = 1.0

  music.set_volume(vol)
