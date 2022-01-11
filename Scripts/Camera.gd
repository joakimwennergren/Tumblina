extends Camera2D

var player: RigidBody2D = null

func _ready():
	player= get_parent().get_node("RigidBody2D")
	pass 


func _process(_delta):
	
	# Follow the player
	position = player.position
	
	pass


func _on_Area2D_body_entered(body):
	if(body.name == "Platform" or body.name == "Diamond"):
		body.queue_free()
	pass # Replace with function body.


func _on_Area2D_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
	if(area.name == "Alien"):
		area.get_parent().queue_free()
	pass # Replace with function body.
