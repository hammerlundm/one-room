extends Control

#Variables that can be changed
var PLAYER_POS = Vector2(0, 0)
var DOOR_POS = Vector2(480, 640)

#other variables
var player_scene = preload("res://scenes/player.tscn")
var door_scene = preload("res://scenes/door.tscn")
var player = null
var door = null

var levels = ["start", "0g", "fast", "ice", "reverse_controls"]
var current = 0

func player_enter_door(body):
	if body == player:
		current += 1
		load_level(current)

func load_level(level):
	if player:
		player.queue_free()
	player = player_scene.instance()
	var player_script = load("res://scripts/player_" + levels[level] + ".gd")
	player.set_script(player_script)
	player.set_pos(PLAYER_POS)
	add_child(player)
	if door:
		door.queue_free()
	door = door_scene.instance()
	door.set_pos(DOOR_POS)
	door.connect("body_enter", self, "player_enter_door")
	add_child(door)

func _ready():
	load_level(0)
