extends "res://src/personaje.gd"

var bt_right = "ui_right"
var bt_left = "ui_left"
var bt_up = "ui_up"
var bt_hit = "ui_accept"

func _ready():
	pass

func accionar():
	if Input.is_action_pressed(bt_right):
		right = true
	else:
		right = false
	if Input.is_action_pressed(bt_left):
		left = true
	else: 
		left = false
	if Input.is_action_pressed(bt_up):
		up = true
	else:
		up = false
	if estado == ESTADO.QUIETO:
		if Input.is_action_pressed(bt_hit):
			golpear()