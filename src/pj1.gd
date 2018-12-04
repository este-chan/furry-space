extends KinematicBody2D

var velocidad = Vector2()
var aceleracion = Vector2()
var ACELERACION = 2 * 1000
var VELOCIDAD_MAXIMA = 40 * 1000
var GRAVEDAD = Vector2(0,-9.8)

func get_input():
	if Input.is_action_pressed('pj_right'):
		aceleracion.x += 1
	if Input.is_action_pressed('pj_left'):
		aceleracion.x -= 1
	if Input.is_action_pressed('pj_up'):
		aceleracion.y -= 1
	aceleracion = aceleracion.normalized() * ACELERACION
	
	#aceleracion -= GRAVEDAD
	var nuevaVel = velocidad+aceleracion
	if nuevaVel.length() < VELOCIDAD_MAXIMA:
		velocidad += aceleracion
	

func _physics_process(delta):
	get_input()
	move_and_slide(velocidad * delta)
	