extends RigidBody2D

@export var damage = 100
@export var force:float
func _input(_event):
	if Input.is_action_pressed("Shoot"):
		shoot(Vector2(-100,-1000))
func shoot(direction: Vector2):
		linear_velocity +=direction*force
		#Nach dem Schuss Shotstate = false setzen
	
