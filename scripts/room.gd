extends Control

var player_scene = preload("res://scenes/player.tscn")
var player = null

var levels = ["start", "0g", "fast", "ice", "reverse_controls"]
var current = 0

func thing(body):
	if body == player:
		print("!!!")
		current += 1
		player.queue_free()
		player = player_scene.instance()
		var script = load("res://scripts/level_" + levels[current] + ".gd")
		player.set_script(script)
		add_child(player)
		print(levels[current])

func _ready():
	player = player_scene.instance()
	add_child(player)
	var door = get_node("door")
	door.connect("body_enter", self, "thing")
