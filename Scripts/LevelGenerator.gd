extends Node

# Objects
onready var Platform = load("res://Objects/Platform.tscn")
onready var Scoreable = load("res://Objects/Scoreable.tscn")
onready var Alien = load("res://Objects/Alien.tscn")
onready var Reddie = load("res://Objects/Reddie.tscn")
onready var Limit = load("res://Objects/Limit.tscn")
onready var Checkpoint = load("res://Objects/Checkpoint.tscn")
onready var Life = load("res://Objects/Life.tscn")
onready var Arrow = load("res://Objects/Arrow.tscn")
# Offsets
export var PLATFORM_YOFFSET: int = 3000

# Random factors
var platformChance: int = 0
var scoreableChance: int = 0
var lifeChance: int = 0
var enemyChance: int = 0
var reddieChance: int = 0
var arrowChance: int = 0

# Positional variables
var trigger: int = 0
var index: int = 0

# Camera
var CameraPositionY: int = 0
var PlayerCamera: Camera2D = null

func _ready():
	# Find & assign the camera
	PlayerCamera = get_parent().get_node("Player/Camera2D")
	pass
	

func _process(_delta):
	
	# Update Camera position
	CameraPositionY = int(PlayerCamera.position.y)
	
	# Trigger every 400 pixel in y direction
	trigger = int(CameraPositionY) / 300
	
	# Time to build new rows..	
	if(!GameManager.triggers.has(trigger)):
		Build()
		GameManager.triggers.append(trigger)	
	pass
	
func AddCheckpoint():
	if(index % 2 == 0):
		var checkpoint = Checkpoint.instance()
		checkpoint.position = Vector2(0, PLATFORM_YOFFSET * trigger)
		add_child(checkpoint)
	index += 1
	pass
	
func AddBackground():
	var textureHeight = get_parent().get_node("Background").texture.get_height()
	var sprite = Sprite.new()
	sprite.texture = get_parent().get_node("Background").texture
	sprite.position.y += index * textureHeight - 200
	sprite.position.x = 660
	sprite.name = "bg"
	get_parent().get_node("Background").add_child(sprite)
	pass
	
func Build():
	
	# Randomize the RNG
	randomize()
	
	# Add a new Checkpoint
	AddCheckpoint()
	
	# Add a new background
	AddBackground()
	
	for x in range(10):
		for y in range(5):
			
			# 2 in 9 chance to spawn a platform
			platformChance = randi() % 9
			
			# 1 in 40 to spawn a scorable
			scoreableChance = randi() % 40
			
			# 1 in 60 to spawn a heart
			lifeChance = randi() % 60
			
			# 1 in 80 chance to spawn an enemy
			enemyChance = randi() %  80
			
			reddieChance = randi() % 300
			
			arrowChance = randi() % 100
			
			# Calculate x and y position
			var xPos = (x * 160) - 600
			var yPos = (-y  * 160) + PLATFORM_YOFFSET + CameraPositionY * 2
			
			# Add limits to left and right
			var limitLeft = Limit.instance()
			var limitRight = Limit.instance()
			
			limitLeft.position = Vector2(-800, yPos)
			limitRight.position = Vector2(1000, yPos)
			
			add_child(limitLeft)
			add_child(limitRight)
			
			# Spawn a platform
			if(platformChance == 2 or platformChance == 4):
				var platform = Platform.instance()
				platform.position = Vector2(xPos, yPos)
				add_child(platform)	
				GameManager.platforms.append(platform)
				
			# If not a platform spawn other stuff..
			else:
				if(scoreableChance == 2):
					var scoreable = Scoreable.instance()
					scoreable .position = Vector2(xPos, yPos)
					add_child(scoreable)
			
				if(lifeChance == 4):
					var life = Life.instance()
					life.position = Vector2(xPos, yPos)
					add_child(life)
					
				if(enemyChance == 1):
					var alien = Alien.instance()
					alien.position = Vector2(xPos, yPos)
					add_child(alien)
					
				if(reddieChance == 1):
					var reddie = Reddie.instance()
					reddie.position = Vector2(xPos, yPos)
					add_child(reddie)
