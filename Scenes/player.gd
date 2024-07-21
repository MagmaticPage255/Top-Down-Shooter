extends CharacterBody2D


@export var SPEED = 300.0
@export var ACCELERATION = 20.0
@export var FRICTION = 10.0
const bullet = preload("res://Scenes/bullet.tscn")
@onready var world = get_node('/root/World')

# Get the gravity from the project settings to be synced with RigidBody nodes.
func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)

func _process(delta):
	look_at(get_global_mouse_position())
	rotation_degrees += 90

	move_and_slide()

func fire():
	var bullet = bullet_scene.instance()
	bullet.drection = 
