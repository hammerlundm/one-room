extends Control

var player_scene = preload("res://scenes/player.tscn")
var door_scene = preload("res://scenes/door.tscn")
var player = null
var door = null
var ui = null

var levels = ["start", "screen_angle", "screen_sideways", "screen_rotation", "fake_doors", "alt_controls", "static", "0g", "sonar", "invisible", "switch_gravity", "bounce", "reverse_gravity",
              "reverse_controls"]
var current = 0

func player_enter_door(body):
	if body == player:
		current += 1
		if current < levels.size():
			load_level(current)
		else:
			pass
			get_node("ui/victory").show()

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
	ui = get_node("ui")
	get_node("ui/victory").hide()
	get_node("ui/victory").set("custom_colors/font_color", Color(.8, 0, .6))
	load_level(0)
