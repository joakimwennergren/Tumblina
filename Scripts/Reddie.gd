extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed
var played = false
var engage = false
# Called when the node enters the scene tree for the first time.
func _ready():
	speed = rand_range(100, 150)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(engage):
	
			
		var dir = (GameManager.playerPosition - global_position).normalized()
		move_and_collide(dir * speed * delta)
		
		if(dir.x <= 0):
			get_node("AnimatedSprite").flip_h = false
		else:
			get_node("AnimatedSprite").flip_h = true


func _on_Area2D_body_entered(body):
	engage = true
	pass # Replace with function body.



func _on_Area2D2_body_entered(body):
	if(body.name == "Player"):
		if(!played):
			get_node("AudioStreamPlayer2D").play()
			played = true
			GameManager.gameOver = true
			GameManager.life = 0
			#body.get_node("Joakim").visible = false

	pass # Replace with function body.


func _on_Timer_timeout():
	GameManager.gameOver = true
	GameManager.life = 0
	pass # Replace with function body.
