extends "player.gd"

func get_input(delta):
	if Input.is_action_pressed("alt_left"):
		a.x -= SPEED * SPEED_FACTOR * delta
		if is_colliding() and abs(get_collision_normal().y + sign(G.y)) < 0.01:
			sprite.play("left")
	if Input.is_action_pressed("alt_right"):
		a.x += SPEED * SPEED_FACTOR * delta
		if is_colliding() and abs(get_collision_normal().y + sign(G.y)) < 0.01:
			sprite.play("right")
	if Input.is_action_pressed("ui_select") and is_colliding() and abs(get_collision_normal().y + sign(G.y)) < 0.01:
		jump(delta)
