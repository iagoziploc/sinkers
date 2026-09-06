extends CharacterBody2D

@export var speed := 300.0
var init_pos : Vector2
var init_vel : Vector2

func _ready() -> void:
	init_pos = position
	init_vel = velocity

func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity += get_gravity() * delta

	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	
func morir(motivo: String):
	position = init_pos
	velocity = init_vel
	print(motivo)
