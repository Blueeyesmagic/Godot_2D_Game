extends RigidBody2D
class_name Spawnables
@export var crate:int
var normal_crate: bool
var harder_crate: bool
var explosive: bool
var exp_force: float
var health: int
var damage: int
var crate_name:String
var object
@onready var sprite = $Sprite2D
@onready var explosion = $GPUParticles2D
@onready var timer = $Timer
@onready var area = $Area2D
func _ready():
	wich_crate()
	print("crate_name")
	sprite.texture = load("res://Textures/Crates/"+crate_name+".jpg")
	timer.connect("timeout", Callable(self, "_on_destruction_timer_timeout"))
	timer.one_shot = true		#edit texture
	
func take_damage(hit_damage:int):
	health-=hit_damage
	if health <= 0:
		queue_free()
func give_damage():
	return damage
#Array of objects im umkreis und das dann Loopen
func explode():
	if explosive:
		print("explode")
		getbodies()
		explosion.emitting = true
		sprite.texture=null
		explosive=false
		timer.wait_time = 1  # or a fixed time if you know it
		timer.start()
func wich_crate():
		match crate: 
			0: #normal
				normal_crate=true
				health=100
				if crate_name =="":
					crate_name = "Normal_crate"
				#edit texture
			1: #harder
				harder_crate=true
				health=200
				if crate_name =="":
					crate_name = "hard_crate"
				#edit texture

			2: #explosive
				explosive=true
				health=1
				exp_force= randi_range(10,15)
				damage = 50
				if crate_name =="":
					crate_name = "Explosive_crate"
				#edit texture
			3: #random state
				crate=randi_range(0,2)
				if crate_name =="":
					crate_name = "random_crate"
				wich_crate()
				
func _on_timer_timeout():
	print("zuende")
	queue_free()
func getbodies():
	for object in area.get_overlapping_bodies():
		print(object)
		if object is RigidBody2D:
			print("ridgetbody")
			var direction = object.position-position
			object.linear_velocity= direction*exp_force
		
