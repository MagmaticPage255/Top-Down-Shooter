extends CharacterBody2D


@onready var ray_cast_2d = $RayCast2D
@export var SPEED = 300.0
@export var ACCELERATION = 20.0
@export var FRICTION = 10.0

# Get the gravity from the project settings to be synced with RigidBody nodes.

var dead = false

func _process(delta):
	look_at(get_global_mouse_position())
	rotation_degrees += 90

	if Input.is_action_just_pressed("shoot"):
		shoot()
	if dead:
		return
	move_and_slide()

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	if dead:
		return
		

func kill():
	if dead:
		return
	dead = true

func shoot():
	$MuzzleFlash.show()
	$MuzzleFlash/Timer.start()
	$ShootSound
	if ray_cast_2d.is_colliding() and ray_cast_2d.get_collider().has_method("kill"):
		ray_cast_2d.get_collider().kill()
