extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for floater in get_tree().get_nodes_in_group("floater"):
		floater.murio.connect(_on_floater_murio)

func _on_floater_murio(position) -> void:
	print("muelto")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
