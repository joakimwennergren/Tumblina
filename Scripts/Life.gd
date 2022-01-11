extends Node2D

func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		if(GameManager.life < 5):
			GameManager.life += 1
			get_parent().queue_free()
	pass
