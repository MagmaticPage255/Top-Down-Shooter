extends Area2D

@export var experience_value = 1
var collected = false
@onready var player = get_tree().get_first_node_in_group("player")



func _process(delta):
	if collected:
		if player:
			global_position = global_position.move_toward(player.global_position, 300 * delta)
		
func collect():
	collected = true


func _on_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
