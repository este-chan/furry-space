extends KinematicBody2D

var ACELERACION = 2 * 1000
var VELOCIDAD_MAXIMA = 40 * 1000

var GRAVEDAD = Vector2(0,-980)
var FRICCION = 0.1

var velocidad = Vector2(0,0)
var aceleracion = Vector2(0,0)


var right = false
var left = false
var up = false

func _physics_process(delta):
	accionar()
	get_acciones()
	acelerar()
	move_and_slide(velocidad * delta)
	
func get_acciones():
	aceleracion = Vector2(0,0)
	if right:
		aceleracion.x = 1
	if left:
		aceleracion.x = -1
	if up:
		aceleracion.y -= 1
	aceleracion = aceleracion.normalized() * ACELERACION
	
func acelerar():
	aceleracion -= GRAVEDAD
	velocidad -= velocidad*FRICCION
	var nuevaVel = velocidad+aceleracion
	if nuevaVel.length() < VELOCIDAD_MAXIMA:
		velocidad += aceleracion
