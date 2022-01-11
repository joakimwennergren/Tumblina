extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var Spit = load("res://Sprites/Image 521.png")

var spits = []
var timer
var speed
# Called when the node enters the scene tree for the first time.
func _ready():
	
	speed = randi() % 5
	timer = Timer.new()
	timer.connect("timeout", self, "spit")
	
	if(GameManager.level >= 10):
		timer.set_wait_time((randi() % 1) + 1)
	else:
		timer.set_wait_time((randi() % 6) + 1)
	
	add_child(timer)
	
	timer.start()
	pass # Replace with function body.

func _process(delta):
	

	
	for i in range(spits.size()):
		if(get_parent().get_node("Sprite").flip_h):
			spits[i].position.x += 5
		else:
			spits[i].position.x -= 5
	pass
	
func kill(body):
	if(body.name == "Player"):
		GameManager.life -= 1
		spits.pop_back().queue_free()
	pass

func spit():
	
	var area = Area2D.new()
	var coll = CollisionShape2D.new()
	var spit = Sprite.new()
	spit.texture = Spit
	coll.shape = CircleShape2D.new()
	area.scale = Vector2(0.03,0.03)
	area.name = "Bullet"
	area.monitoring = true
	area.connect("body_entered", self, "kill")
	area.add_child(spit)
	area.add_child(coll)
	spits.append(area)
	add_child(area)		
	pass # Replace with function body.
