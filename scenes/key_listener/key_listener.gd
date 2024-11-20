extends Node2D
class_name KeyListener

enum InputKey {
	UP,
	DOWN,
	RIGHT,
	LEFT
}

@export var key: InputKey = InputKey.UP
@export var note_track: NoteTrack
@export var perfect_threshold: float = 25.0
@export var great_threshold: float = 50.0
@export var ok_threshold: float = 75.0

@onready var sprite_2d: Sprite2D = %Sprite2D

var input_array: Array[String] = ["ui_up", "ui_down", "ui_right", "ui_left"]

func _ready() -> void:
	sprite_2d.modulate.a = 0.5

func _process(delta: float) -> void:
	var current_falling_note = get_current_falling_note()
	
	if Input.is_action_just_pressed(input_array[key]):
		sprite_2d.modulate.a = 1
		if current_falling_note:
			register_hit(current_falling_note)
	elif Input.is_action_pressed(input_array[key]):
		sprite_2d.modulate.a = 1
	
	if Input.is_action_just_released(input_array[key]):
		sprite_2d.modulate.a = 0.5

func get_current_falling_note() -> FallingNote:
	if not note_track.falling_note_active_array.size():
		return null
	
	var current_falling_note: FallingNote = note_track.falling_note_active_array.front()
	
	if current_falling_note:
		var falling_note_distance: float = global_position.y - current_falling_note.global_position.y
		
		var is_passed: bool = (falling_note_distance + ok_threshold) < 0
		
		if is_passed:
			var popped_falling_note: FallingNote = note_track.falling_note_active_array.pop_front()
			if popped_falling_note:
				popped_falling_note.queue_free()
			return null
		else:
			return current_falling_note
	
	return null

func register_hit(current_falling_note: FallingNote) -> void:
	var falling_note_distance: float = abs(global_position.y - current_falling_note.global_position.y)
	
	if falling_note_distance <= perfect_threshold:
		print("Perfect")
		erase_current_falling_note()
	elif falling_note_distance <= great_threshold:
		print("Great")
		erase_current_falling_note()
	elif falling_note_distance <= ok_threshold:
		print("Ok")
		erase_current_falling_note()
	else:
		print("Ignore")

func erase_current_falling_note() -> void:
	var current_falling_note: FallingNote = note_track.falling_note_active_array.pop_front()
	if current_falling_note:
		current_falling_note.queue_free()
