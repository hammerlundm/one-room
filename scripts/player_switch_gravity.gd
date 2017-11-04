extends "player.gd"

func jump(delta):
	G *= -1
	sprite.scale(Vector2(1, -1))
	sprite.play("jump")

