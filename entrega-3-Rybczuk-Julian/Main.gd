extends Node
class_name wall
onready var player = $Player
onready var turret_spawner = $TurretsSpawner

func _ready():
	randomize()
	player.initialize(self)
