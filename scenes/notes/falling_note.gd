extends Node2D
class_name FallingNote

@export var speed: float = 400.0

func _process(delta: float) -> void:
	position.y += speed * delta
