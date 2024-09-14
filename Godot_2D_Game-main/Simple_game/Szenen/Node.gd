extends Node

@onready var Bullet:Node2D = $"../Node2D"
@onready var Explosive:Node2D= $"../Explosive"

func _input(_event):
	if Input.is_action_pressed("W"):
		Explosive.explode(Bullet)
