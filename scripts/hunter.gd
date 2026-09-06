extends CharacterBody2D


@export var idle_speed := 150.0
@export var target_speed := 300
@export var hunt_interval := 10
var direccion := Vector2.from_angle(randf_range(0, TAU))
var tiempo : float


func _physics_process(delta: float) -> void:
	if tiempo >= hunt_interval:
		direccion = Vector2.from_angle(randf_range(0, TAU))
		print("cambio direccion")
		tiempo = 0.0

	tiempo += delta
	velocity = direccion * idle_speed
	move_and_slide()
