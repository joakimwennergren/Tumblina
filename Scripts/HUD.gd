extends CanvasLayer

var oldLevel: int = 0

func _process(_delta):
	
	get_node("Score").get_node("NinePatchRect/Label2").text = String(GameManager.score) + "p"
	
	if(GameManager.level != oldLevel):
		get_node("Level/Label/AnimationPlayer").play("PopUp")
		get_node("Level/Label/Timer").start()
		get_node("Level/Label").text = "Level " + String(GameManager.level) 
		oldLevel = GameManager.level
		
	if(GameManager.life == 5):
		get_node("Score/NinePatchRect/Heart1").visible = true
		get_node("Score/NinePatchRect/Heart2").visible = true
		get_node("Score/NinePatchRect/Heart3").visible = true
		get_node("Score/NinePatchRect/Heart4").visible = true
		get_node("Score/NinePatchRect/Heart5").visible = true
	if(GameManager.life == 4):
		get_node("Score/NinePatchRect/Heart1").visible = true
		get_node("Score/NinePatchRect/Heart2").visible = true
		get_node("Score/NinePatchRect/Heart3").visible = true
		get_node("Score/NinePatchRect/Heart4").visible = true
		get_node("Score/NinePatchRect/Heart5").visible = false
	
	if(GameManager.life == 3):
		get_node("Score/NinePatchRect/Heart1").visible = true
		get_node("Score/NinePatchRect/Heart2").visible = true
		get_node("Score/NinePatchRect/Heart3").visible = true
		get_node("Score/NinePatchRect/Heart4").visible = false
		get_node("Score/NinePatchRect/Heart5").visible = false
		
	if(GameManager.life == 2):
		get_node("Score/NinePatchRect/Heart1").visible = true
		get_node("Score/NinePatchRect/Heart2").visible = true
		get_node("Score/NinePatchRect/Heart3").visible = false
		get_node("Score/NinePatchRect/Heart4").visible = false
		get_node("Score/NinePatchRect/Heart5").visible = false
		
	if(GameManager.life == 1):
		get_node("Score/NinePatchRect/Heart1").visible = true
		get_node("Score/NinePatchRect/Heart2").visible = false
		get_node("Score/NinePatchRect/Heart3").visible = false
		get_node("Score/NinePatchRect/Heart4").visible = false
		get_node("Score/NinePatchRect/Heart5").visible = false
		
	if(GameManager.life == 0):
		get_node("Score/NinePatchRect/Heart1").visible = false
		get_node("Score/NinePatchRect/Heart2").visible = false
		get_node("Score/NinePatchRect/Heart3").visible = false
		get_node("Score/NinePatchRect/Heart4").visible = false
		get_node("Score/NinePatchRect/Heart5").visible = false
	
	pass


func _on_Timer_timeout():
	get_node("Level/Label/AnimationPlayer").play("popAway")
	pass # Replace with function body.

func _on_PlatformGenerator_newLevel():
	get_node("Level/Label/AnimationPlayer").play("PopUp")
	get_node("Level/Timer").start()
	pass # Replace with function body.

func _on_TouchScreenButton_pressed():
	GameManager.reset = true
	pass # Replace with function body.
