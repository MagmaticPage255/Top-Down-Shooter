extends CharacterBody2D


@onready var ray_cast_2d = $RayCast2D
@onready var enemy = "res://Scenes/enemy#1.tscn"
@onready var healthBar = $UI/Control/Health
@export var SPEED = 300.0
@export var ACCELERATION = 20.0
@export var FRICTION = 10.0
@export var damage = 1

var maxPlayerHealth = 25
var health = 25

var dead = false

func _ready():
	healthBar.set_health_bar(health, maxPlayerHealth)

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	if dead:
		return



func _physics_process(delta):
	if dead:
		return
	
	look_at(get_global_mouse_position())
	rotation_degrees += 90

	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	if direction:
		velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
	move_and_slide()

func kill():
	if dead:
		return
	dead = true
	get_tree().change_scene_to_file("res://Scenes/death_screen.tscn")
	z_index = -1


func shoot():
	if dead:
		return
	$MuzzleFlash.show()
	$MuzzleFlash/Timer.start()
	$ShootSound.play()
	if ray_cast_2d.is_colliding() and ray_cast_2d.get_collider().has_method("take_damage"):
		ray_cast_2d.get_collider().take_damage(damage)


func _on_pickup_area_area_entered(area):
	if area.is_in_group("Pickup"):
		if area.has_method("collect"):
			area.collect()
			
			

func take_damage(damage):
	if area.is_in_group("Enemy"):
		health-=1
		area.die()
		progress_bar.value = health
		if health <= 0:
			get

func die():
	if dead:
		return
	dead = true
	get_tree().change_scene_to_file("res://Scenes/death_screen.tscn")
	z_index = -1
