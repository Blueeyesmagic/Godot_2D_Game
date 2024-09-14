extends RigidBody2D
class_name Spawnables
@export var crate:int
var normal_crate: bool
var harder_crate: bool
var explosive: bool
var exp_force: float
var health: int
var damage: int
var texture: Texture2D
func _ready():
	wich_crate()
			#edit texture
	
func take_damage(hit_damage:int):
	health-=hit_damage
	if health <= 0:
		queue_free()
func give_damage():
	return damage
func explode(object: Node2D):
	if explosive:
		print("explode")
		var direction = object.position-position
		object.linear_velocity +=direction*exp_force
		#queue_free()
func wich_crate():
		match crate: 
			0: #normal
				normal_crate=true
				health=100
				#edit texture
			1: #harder
				harder_crate=true
				health=200
				#edit texture

			2: #explosive
				explosive=true
				health=1
				exp_force= randi_range(10,15)
				
				damage = 50
				#edit texture
			3: #random state
				crate=randi_range(0,2)
				wich_crate()
