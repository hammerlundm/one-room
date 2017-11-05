extends "player.gd"

var ANGLE = PI

func apply():
	var camera = get_node("camera")
	camera.rotate(ANGLE)
	camera.set_offset(camera.get_offset().rotated(ANGLE))
	