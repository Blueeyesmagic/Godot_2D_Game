extends RigidBody2D
class_name Spawnables

@export var explosive: bool
@export var exp_force: float
@export var health: int
@export var damage: int
@export var texture: Texture2D

func take_damage(hit_damage:int):
	health-=hit_damage
	if health <= 0:
		queue_free()
func give_damage():
	return damage
func explode(object: Node2D):
	var direction = object.position-position
	object.linear_velocity +=direction*exp_force
	queue_free()
