extends Area2D

@export var speed = 400

func _physics_process(delta):
	var velocity = Vector2(speed, 0).rotated(rotation)
	move_and_collide()
