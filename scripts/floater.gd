extends Area2D

var tiempo : float
# posición e impulso al sinker
@export var impulso := -400
var init_pos : Vector2
# qué tan rápido se mueven
@export var oscilacion := Vector2(0.3, 0.6)
# dentro de qué rango respecto a su posición inicial
@export var amplitud := Vector2(15, 40)
#random, para que no empiecen todos en el mismo lugar
var offset : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_pos = position
	offset = Vector2(randf_range(0, TAU), randf_range(0, TAU))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	tiempo += delta
	var angulo := tiempo * oscilacion + offset
	# vaivén = seno del ángulo acumulado, por eje
	var vaiven := Vector2(sin(angulo.x), sin(angulo.y))
	position = init_pos + amplitud * vaiven

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("sinker"):
		body.velocity.y = impulso
