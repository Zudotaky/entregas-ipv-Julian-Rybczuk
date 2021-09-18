extends Sprite
class_name Turret

var player

onready var fire_position:Position2D = $FirePosition
export var projectile_scene:PackedScene

var projectile_container:Node

func set_values(player,container):
	self.player = player
	self.projectile_container = container
	$Timer.start()


func _on_Timer_timeout():
	fire()

func fire():
	var projectile:Projectile = projectile_scene.instance()
	projectile_container.add_child(projectile)
	projectile.set_starting_values(fire_position.global_position,
	(player.global_position-self.global_position).normalized())
	projectile.connect("delete_requested",self,"_on_projectile_deleterequested")

func _on_projectile_deleterequested(projectile):
	projectile_container.remove_child(projectile)
	projectile.queue_free()
