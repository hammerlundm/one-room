extends "player.gd"

var door_img = preload("res://assets/door.png")

func apply():
	var door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(1500, 1500))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")
