extends KinematicBody2D

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if Input.is_action_pressed("ui_left"):
		move(Vector2(-10, 0))
	elif Input.is_action_pressed("ui_right"):
		move(Vector2(10, 0))
