extends KinematicBody2D

var speed:int = 70
var gravedad:float = 10  # gravity force
var velocidadSalto:int = -300

var velocidad:Vector2 = Vector2.ZERO


func _process(delta):
	var direction:int = int(Input.is_action_pressed("mover_derecha")) - int(Input.is_action_pressed("mover_izqueirda"))
	
	
	if direction != 0:
		$AnimatedSprite.animation = "caminar"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = direction < 0
	
	velocidad.x = direction * speed * delta
	
	move_and_collide(velocidad)
	
func _physics_process(delta):
	velocidad.y += gravedad*delta
	velocidad = move_and_slide(velocidad,Vector2.UP)
	if Input.is_action_just_pressed("mover_arriva"):
		print(is_on_floor())
		if is_on_floor():
			velocidad.y = velocidadSalto*delta
