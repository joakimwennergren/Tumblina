extends Node2D

var level = 0
var levels = []

func _ready():
	name = "Checkpoint"
	pass


func _on_RigidBody2D2_body_entered(body):
	if(body.name == "Player"):
		if(!levels.has(level)):
			GameManager.level += 1
			level += 1
			levels.append(level)
	pass 
