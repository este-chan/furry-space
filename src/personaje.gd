extends KinematicBody2D

#Constantes globales
export var ACELERACION = 2000
export var SALTO = 50000
export var VELOCIDAD_MAXIMA_X = 40000
export var VELOCIDAD_MAXIMA_Y = 40000

export var GRAVEDAD = Vector2(0,-1500)
export var FRICCION = 0.1

#Variables auxiliares
var velocidad = Vector2(0,0)
var aceleracion = Vector2(0,0)
var x

#Variables del juego
signal vida_changed
var vida = 100

enum ESTADO{
	QUIETO,
	SALTANDO,
	GOLPEANDO,
	GOLPEADO
}
var estado = ESTADO.QUIETO

var right = false
var left = false
var up = false
	
func _physics_process(delta):
	aceleracion = Vector2(0,0)
	if vida > 0:
		get_acciones()
	acelerar()
	move_and_slide(velocidad * delta,Vector2(0,-1))
	
	
func get_acciones():
	#Obtener movimiento horizontal
	x = int(right) - int(left)
	#Girar el Sprite
	if x!=0:
		$cuerpo.scale.x = x
	
	if is_on_floor():
		velocidad.y = 0
		if up:
			aceleracion.y -= SALTO
	aceleracion.x = x*ACELERACION
	
func acelerar():
	aceleracion -= GRAVEDAD
	velocidad.x -= velocidad.x*FRICCION
	var nuevaVel = velocidad+aceleracion
	if nuevaVel.x < VELOCIDAD_MAXIMA_X:
		velocidad.x += aceleracion.x
	if nuevaVel.y < VELOCIDAD_MAXIMA_Y:
		velocidad.y += aceleracion.y
		
func golpear():
	$animacion.play('golpear')
	#estado = ESTADO.GOLPEANDO

func golpeado(dir):
	vida -= 15
	emit_signal("vida_changed", vida)
	velocidad += Vector2(50000*dir, 0)
	if vida <= 0:
		morir()
		
func morir():
	$animacion.play("morir")