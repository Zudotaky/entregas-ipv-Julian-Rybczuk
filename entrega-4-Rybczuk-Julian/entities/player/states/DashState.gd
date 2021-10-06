extends "res://entities/AbstractState.gd"


func enter():
	parent.velocity.x = parent.velocity.x + parent.dash_speed * parent.dash_direction



func update(delta:float):
	parent._handle_cannon_actions()
	parent._handle_move_input()
	if parent.move_direction == 0:
		parent._handle_deacceleration()
	parent._apply_movement()
	
	if parent.is_on_floor():
		if parent.move_direction != 0:
			emit_signal("finished","walk")
		else:
			emit_signal("finished","idle")
	else: 
			emit_signal("finished","jump")


