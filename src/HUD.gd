extends CanvasLayer


func _ready():
	pass # Replace with function body.



func _on_pj1_vida_changed(vida):
	$p1.value = vida


func _on_pj2_vida_changed(vida):
	$p2.value = vida
