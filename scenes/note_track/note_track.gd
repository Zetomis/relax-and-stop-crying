extends Node2D
class_name NoteTrack

@export var falling_note_scene: PackedScene

var falling_note_queue: Array[String] = ["Note", "Null", "Note", "Note"]
var falling_note_active_array: Array[FallingNote]

@onready var note_spawn_timer: Timer = %NoteSpawnTimer

func _ready() -> void:
	add_falling_note("Null")
	add_falling_note("Note")
	if falling_note_queue.size():
		note_spawn_timer.start(0.25)

func add_falling_note(type: String) -> void:
	falling_note_queue.append(type)

func spawn_falling_note() -> void:
	var current_note_type: String = falling_note_queue.pop_front()
	
	if current_note_type == "Note":
		var falling_note: FallingNote = falling_note_scene.instantiate() as FallingNote
		
		falling_note_active_array.append(falling_note)
		
		falling_note.global_position = global_position
		
		get_tree().root.call_deferred("add_child", falling_note)
	
	if falling_note_queue.size():
		note_spawn_timer.start(0.25)

func _on_timer_timeout() -> void:
	spawn_falling_note()
