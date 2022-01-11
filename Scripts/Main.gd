extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Game = preload("res://Scenes/Game.tscn").instance()
var Menu = preload("res://Scenes/Menu.tscn").instance()


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.	
