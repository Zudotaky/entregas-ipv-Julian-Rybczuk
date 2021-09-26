extends StaticBody2D

onready var fire_position = $FirePosition
onready var fire_timer = $FireTimer


export (PackedScene) var projectile_scene

var projectile_container
var target:Node2D

func initialize(container, turret_pos, projectile_container):
	container.add_child(self)
	global_position = turret_pos
	self.projectile_container = projectile_container
	fire_timer.connect("timeout", self, "fire_at_player")

func fire_at_player():
	var proj_instance = projectile_scene.instance()
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(global_position, target.global_position, [self],1).get("collider")
	if result == target:
		proj_instance.initialize(projectile_container, fire_position.global_position, fire_position.global_position.direction_to(target.global_position))


func _on_DetectionArea_body_shape_entered(body_id, body, body_shape, local_shape):
	if (target == null) :
		target = body
		fire_timer.start()


func _on_DetectionArea_body_shape_exited(body_id, body, body_shape, local_shape):
	if (target == body) :
		target = null
		fire_timer.stop()
		
		
func _remove():
	queue_free()
	

