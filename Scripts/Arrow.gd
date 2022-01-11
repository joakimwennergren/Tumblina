extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var played = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		if(!played):
			GameManager.arrows += 1
			get_node("AudioStreamPlayer2D").play()
			get_node("AudioStreamPlayer2D/Timer").start()
			played = true
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
