extends Control

var player_scene = preload("res://scenes/player.tscn")
var door_scene = preload("res://scenes/door.tscn")
var player = null
var door = null

var levels = ["start", "bounce", "reverse_gravity", "0g", "fast", "ice", "reverse_controls"]
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
	add_child(player)
	if door:
		door.queue_free()
	door = door_scene.instance()
	if File.new().file_exists("res://scripts/door_" + levels[level] + ".gd"):
		var door_script = load("res://scripts/door_" + levels[level] + ".gd")
		door.set_script(door_script)
	add_child(door)
	door.connect("body_enter", self, "player_enter_door")

func _ready():
	load_level(0)
