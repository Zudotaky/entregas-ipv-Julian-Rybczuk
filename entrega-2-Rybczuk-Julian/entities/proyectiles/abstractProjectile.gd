extends Sprite
class_name Projectile

signal delete_requested(projectile)
var speed:float=200
var direction:Vector2
var visible_rect:Rect2 

func _ready():
	set_physics_process(false)
	visible_rect = get_viewport().get_visible_rect()


func set_starting_values(starting_position:Vector2, start_direction:Vector2):
	position = starting_position
	self.direction = start_direction
	$Timer.start()
	set_physics_process(true)

func _physics_process(delta):
	position += direction * delta * speed
	if not visible_rect.has_point(position):
		emit_signal("delete_requested",self)
		


func _on_Timer_timeout():
	emit_signal("delete_requested",self)
