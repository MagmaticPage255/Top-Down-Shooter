extends CharacterBody2D

@onready var ray_cast_2d = $RayCast2D
@onready var sprite = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("player")

@export var SPEED: float = 200.0
@export var ACCELERATION: float = 20.0
@export var FRICTION: float = 10.0
@export var enemy_health: int = 10
@export var damage: int = 1
@export var damage_cooldown_time: float = 1.0

const EXPERIENCE_DOGTAG = preload("res://Scenes/xp_dogtag.tscn")

var can_damage: bool = true
var dead: bool = false

func _physics_process(delta: float) -> void:
	if dead:
		return

	var direction_to_player: Vector2 = global_position.direction_to(player.global_position)
	velocity = direction_to_player * SPEED
	look_at(player.global_position)
	rotation_degrees += 90  # Adjust rotation if needed
	move_and_slide()

	if ray_cast_2d.is_colliding() and ray_cast_2d.get_collider() == player and can_damage:
		player.take_damage(damage)
		$MuzzleFlash.visible = true
		$MuzzleFlash.get_node("Timer").start()
		can_damage = false
		await get_tree().create_timer(damage_cooldown_time).timeout
		can_damage = true

<<<<<<< HEAD


func take_damage(dmg):
=======
func take_damage(dmg: int) -> void:
>>>>>>> b620859f34c4afe6073e86e131314e888ec96559
	enemy_health -= dmg
	if enemy_health <= 0:
		dead = true
		queue_free()
		var new_xp = EXPERIENCE_DOGTAG.instantiate()
		new_xp.global_position = global_position
<<<<<<< HEAD
		add_sibling(new_xp)
	z_index = -1


func _on_cooldown_time_timeout() -> void:
	pass # Replace with function body.
=======
		get_parent().add_child(new_xp)
		z_index = -1
>>>>>>> b620859f34c4afe6073e86e131314e888ec96559
