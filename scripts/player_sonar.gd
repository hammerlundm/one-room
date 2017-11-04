extends "player.gd"

var door_dist
var vol
var music

func _ready():
  ._ready()
  music = get_parent().get_node("StreamPlayer")

func _fixed_process(delta):
  ._fixed_process(delta)
  door_dist = self.get_pos().distance_to(Vector2(3000, 3000))
  vol = 1.0/(door_dist/300)
  if vol < 0.1:
    vol = 0.1
  if vol > 1.0:
    vol = 1.0

  music.set_volume(vol)
