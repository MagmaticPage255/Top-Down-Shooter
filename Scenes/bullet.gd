extends Area2D

var direction = Vector2.RIGHT
@export var speed = 400

func _physics_process(delta):
	translate(direction.normalized() * speed * delta)

func _on_body_entered(body):
	queue_free()
