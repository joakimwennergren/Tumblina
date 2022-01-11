extends Node2D

# Global Variables
var score: int = 0
var gameOver: bool = false

var life: int = 5
var arrows: int = 5

var height: int = 0
var level : int = 1

var platforms: Array = []
var triggers: Array = []

var left: bool = false
var right: bool = false
var locked: bool = false

var playerPosition: Vector2 = Vector2(0,0)

signal GameOver

func _process(_delta):
	if(life <= 0):
		gameOver = true
	pass
