extends Sprite

onready var cannon:Sprite = $cannon

export var max_speed:float= 600
export var acceleration:float = 30
export var friction_weight:float = 0.05

var velocidad:Vector2 = Vector2.ZERO

var projectile_container:Node

func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container

func _physics_process(delta):
	
	var mouse_position:Vector2 = get_global_mouse_position()
	
	cannon.look_at(mouse_position)
	
	if Input.is_action_just_pressed("disparar"):
		cannon.fire()
	
	var movement_direction:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	if movement_direction != 0:
		velocidad.x = clamp( velocidad.x + (movement_direction * acceleration),- max_speed, max_speed)
	else:
		velocidad.x = lerp(velocidad.x ,0,friction_weight) if abs(velocidad.x) > 1 else 0
		
	position += velocidad * delta
	
	
	
