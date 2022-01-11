extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var Gray = load("res://Sprites/Image 373.png")
onready var Gold = load("res://Sprites/Image 503.png")

var type = 0
var left = false
var speed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	speed = rand_range(0.1, 1)
	name = "Platform"
	if(type == 0):
		get_child(0).texture = Gray
	if(type == 1):
		get_child(0).texture = Gold
	#get_node("AnimationPlayer").play("Float")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(GameManager.gameOver or GameManager.life <= 0):
		get_node("CollisionShape2D").disabled = true
	else:
		get_node("CollisionShape2D").disabled = false
	pass
	
	#if(position.x < get_viewport().size.x + 2000):
	#	position.x += speed
	#else:
	#	position.x = get_viewport().size.x + 2000 * -1
		
			
func _on_Platform_body_entered(body):

	pass # Replace with function body.
