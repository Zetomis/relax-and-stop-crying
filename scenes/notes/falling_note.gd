extends Node2D
class_name FallingNote

@export var speed: float = 400.0

func _process(delta: float) -> void:
	position.y += speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#queue_free()
	#print("queue free here")
	pass
