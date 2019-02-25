extends "res://src/jugador.gd"

##Código jugador 1

#Configuracion botones
func _ready():
	bt_left = "pj_left"
	bt_right = "pj_right"
	bt_up = "pj_up"
	bt_hit = "pj_hit"



func _on_cuerpo_body_entered(body):
	if body is preload("res://src/pj2.gd"):
		body.golpeado(get_node('cuerpo').scale.x)
