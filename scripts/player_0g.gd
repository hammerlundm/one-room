extends "player.gd"

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
