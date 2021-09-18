extends Node


func _ready():
	$Player.set_projectile_container(self)
	$enemySpawn.set_values($Player,self)
