extends "player.gd"

func apply():
	G = Vector2(0.0, -1.0)
	INIT_POS = Vector2(1700, 900)
	JUMP_HEIGHT = -1.0
	sprite.scale(Vector2(1, -1))
