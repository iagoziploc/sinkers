extends CharacterBody2D


@export var idle_speed := 150.0
@export var target_speed := 300.0
@export var hunt_interval := 10.0
var direccion := Vector2.from_angle(randf_range(0, TAU))
var tiempo : float
var objetivo = null


func _physics_process(delta: float) -> void:
	if tiempo >= hunt_interval:
		var alive_floaters = get_tree().get_nodes_in_group("floater")
		if not alive_floaters.is_empty():
			var mas_cercano = null
			var menor_distancia = INF
			for floater in alive_floaters:
				var dist = position.distance_to(floater.position)
				if dist < menor_distancia:
					menor_distancia = dist
					mas_cercano = floater
			objetivo = mas_cercano
			print("obj encontrado")
		else: 
			objetivo = null
			print("cambio direccion")
		tiempo = 0.0
		if objetivo != null and is_instance_valid(objetivo):
			direccion = (objetivo.position - position).normalized()
			velocity = direccion * target_speed
		else:
			direccion = Vector2.from_angle(randf_range(0, TAU))
			velocity = direccion * idle_speed

	tiempo += delta
	move_and_slide()
