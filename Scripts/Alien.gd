extends Area2D

func _ready():
	# Name
	name = "Alien"
	
	# Look right or left
	get_child(0).set_flip_h(randi() % 2)
	pass

# If player hits an alien, take 1 life from her..
func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		GameManager.score += 5
		queue_free()
	pass 
