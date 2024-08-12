extends CharacterBody2D

@onready var ray_cast_2d = $RayCast2D

@export var SPEED = 200.0
@export var ACCELERATION = 20.0
@export var FRICTION = 10.0
@onready var sprite = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("player")
@export var enemy_health = 1

var dead = false

func _physics_process(delta):
	var direction_to_player = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	
	look_at(player.position)
	rotation_degrees += 90
	move_and_slide()
	
	
	if ray_cast_2d.is_colliding() and ray_cast_2d.get_collider() == player:
		player.kill()
