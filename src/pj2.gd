extends "res://src/jugador.gd"

##Código jugador 1

#Configuracion botones
func _ready():
	bt_left = "pj2_left"
	bt_right = "pj2_right"
	bt_up = "pj2_up"
	bt_hit = "pj2_hit"



func _on_cuerpo_body_entered(body):
	if body is preload("res://src/personaje.gd"):
		body.golpeado(get_node('cuerpo').scale.x)