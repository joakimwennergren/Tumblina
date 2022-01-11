extends RigidBody2D

var velocity = Vector2()

export var _debug = true

var oldLife = 5
onready var Wiee = get_node("Wiee")
onready var Ouch = get_node("Ouch")

onready var Angel = load("res://Sprites/Image 529.png")

var timer 

func _ready():
	name = "Player"
	pass # Replace with function body.
	
func _process(delta):
	
	GameManager.playerPosition = global_position
	
	if(GameManager.gameOver):
		gravity_scale = -0.5
		get_node("Joakim").texture = Angel
		get_node("Joakim").modulate = Color(1,1,1,0.5)
		get_node("CollisionShape2D").disabled = false
		timer = Timer.new()
		timer.set_wait_time(4)
		add_child(timer)
		timer.connect("timeout", self, "death")
		timer.start()
		
	
	if(GameManager.life != oldLife):
		Ouch.play()
		oldLife = GameManager.life
		
	if(get_angular_velocity() == 0 and velocity.x == 0 and velocity.y == 0):
			GameManager.gameOver = true
			get_tree().change_scene_to(load('res://Scenes/Menu.tscn'))

func _integrate_forces(state):
	if(_debug):
		if GameManager.left or Input.is_action_pressed("left"):
			state.linear_velocity.x -= 100
		if GameManager.right  or Input.is_action_pressed("right"):
			state.linear_velocity.x += 100
	else:
		state.linear_velocity.x -= Input.get_accelerometer().x * 400 * -1
		
	state.linear_velocity.x = lerp(state.linear_velocity.x, 0, 0.1)

func _on_RigidBody2D_body_entered(body):
	if(body.name == "Platform" or body.name == "earth" or body.name == "Checkpoint"):
		if(get_angular_velocity() < -14 or get_angular_velocity()  > 14):
			if(!Wiee.playing):
				Wiee.play()
		var impulse_strength = 8000
		apply_central_impulse(Vector2(0, -1) * impulse_strength)
		
	pass # Replace with function body.

func death():
	get_tree().change_scene("res://Scenes/Main.tscn")
	pass

func _on_Area2D_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	pass # Replace with function body.
