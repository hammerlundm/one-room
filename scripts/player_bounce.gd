extends "player.gd"

func unstick(delta):
	if is_colliding():
		var normal = get_collision_normal()
		v -= v.dot(normal) * normal * 2
	
