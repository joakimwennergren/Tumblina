extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var diamonds = [
	load("res://Sprites/Image 500.png"),
	load("res://Sprites/Pink diamond 3.png"),
	load("res://Sprites/Green diamond 3.png"),
	load("res://Sprites/Gold diamond 3.png"),
]

var score = 0
var points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	name = "Diamond"
	score = randi() % 4
	get_child(0).get_child(0).texture = diamonds[score]
	
	if(score == 0):
		points = 1
	if(score == 1):
		points = 2
	if(score == 2):
		points = 3
	if (score == 3):
		points = 4
	if( score == 4):
		points = 999
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		if(!GameManager.gameOver):
			if(points == 999):
				if(GameManager.life < 5):
					GameManager.life += 1
			else:
				GameManager.score += points
			queue_free()
	pass # Replace with function body.
