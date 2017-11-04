extends "player.gd"

var VHS

func _ready():
	._ready()
	VHS = get_tree().get_root().get_node("room/VHS")

func _fixed_process(delta):
	._fixed_process(delta)
	if v.length() > SPEED_FACTOR / pow(2, FRICTION_FACTOR):
		VHS.set_opacity(0.99)
		VHS.set_blend_mode(BLEND_MODE_MIX)
	else:
		VHS.set_opacity(0.85)
		VHS.set_blend_mode(BLEND_MODE_MUL)

func _exit_tree():
	VHS.set_opacity(0.85)
	VHS.set_blend_mode(BLEND_MODE_MUL)
