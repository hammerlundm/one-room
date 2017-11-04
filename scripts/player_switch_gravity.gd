extends "player.gd"

func get_input(delta):
	if Input.is_action_pressed("ui_left"):
		a.x -= SPEED * SPEED_FACTOR * delta
	if Input.is_action_pressed("ui_right"):
		a.x += SPEED * SPEED_FACTOR * delta
	if Input.is_action_pressed("ui_select") and is_colliding() and abs(get_collision_normal().y + sign(G.y)) < 0.01:
		G *= -1
