extends Node2D

export (PackedScene) var turret_scene

func _ready():
	call_deferred("initialize")


func initialize():
	var visible_rect:Vector2 = global_position
	for i in 3:
		var turret_instance = turret_scene.instance()
		
		var turret_pos:Vector2 = Vector2(rand_range(0, visible_rect.x), rand_range(0, visible_rect.y))
		
		turret_instance.initialize(self, turret_pos, self)
