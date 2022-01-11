extends CanvasLayer


signal Start

func _ready():
	if(!get_node("AudioStreamPlayer2D").playing):
		get_node("AudioStreamPlayer2D").play()
	pass 

func _on_TouchScreenButton_pressed():
	start()
	pass 

func start():
	# Reset State
	GameManager.score = 0
	GameManager.life = 5
	GameManager.level = 1
	GameManager.gameOver = false
	GameManager.platforms.clear()
	GameManager.triggers.clear()
	get_tree().change_scene("res://Scenes/Game.tscn")
	pass
