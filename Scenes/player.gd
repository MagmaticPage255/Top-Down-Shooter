extends CharacterBody2D


@onready var ray_cast_2d = $RayCast2D
@export var SPEED = 300.0
@export var ACCELERATION = 20.0
@export var FRICTION = 10.0

var player_health = 10



func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	look_at(get_global_mouse_position())
	rotation_degrees += 90

	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	move_and_slide()

func shoot():
	$MuzzleFlash.show()
	$MuzzleFlash/Timer.start()
	$ShootSound.play()

