extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Left_pressed():
	if(!GameManager.locked):
		GameManager.left = true
		get_node("ReferenceRect/Left").modulate = Color(1,1,1,0.6)
	pass # Replace with function body.


func _on_Right_pressed():
	if(!GameManager.locked):
		get_node("ReferenceRect2/Right").modulate = Color(1,1,1,0.6)
		GameManager.right = true
	pass # Replace with function body.


func _on_Left_released():
	GameManager.left = false
	get_node("ReferenceRect/Left").modulate = Color(1,1,1,1)
	pass # Replace with function body.


func _on_Right_released():
	get_node("ReferenceRect2/Right").modulate = Color(1,1,1,1)
	GameManager.right = false
	pass # Replace with function body.
