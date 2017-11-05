extends "player.gd"

var door_img = preload("res://assets/door.png")

func apply():
	var door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(1500, 1500))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")

	door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(200, 2048))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")

	door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(2900, 3000))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")

	door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(2100, 200))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")

	door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(1100, 420))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")

	door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(69, 69))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")

	door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(300, 2550))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")

	door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(1111, 2222))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")

	door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(500, 900))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")

	door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(2000, 2000))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")

	door = Sprite.new()
	door.set_texture(door_img)
	door.set_pos(Vector2(500, 2776))
	get_tree().get_root().get_node("room").add_child(door)
	connect("exit_tree", door, "queue_free")
