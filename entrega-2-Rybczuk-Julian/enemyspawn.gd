extends Position2D

export var turrert_Scene:PackedScene


func set_values(player,container):
	
#	var rand = RandomNumberGenerator.new()
	
	var view_size = get_viewport().get_visible_rect().size
	
	for _i in range(0,3):
		var enemy:Turret = turrert_Scene.instance()
		randomize()
		var random_x = randi() % int(view_size.x) 
		var random_y =  randi() % int(view_size.y/2)
		var random_pos = Vector2(random_x, random_y)
		enemy.position = random_pos
		add_child(enemy)
		enemy.set_values(player,container)
