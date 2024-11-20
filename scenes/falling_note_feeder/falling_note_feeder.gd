extends Node2D
class_name FallingNoteFeeder

@export var note_track_array: Array[NoteTrack] = []
@export var note_map_resource_array: Array[NoteMapResource] = []

var note_type_string_array: Array[String] = ["Note", "Null"]

func feed_note_map() -> void:
	for i in range(note_map_resource_array.size()):
		for j in range(4):
			if j == 0:
				note_track_array[j].add_falling_note(note_type_string_array[note_map_resource_array[i].note_type_left])
			if j == 1:
				note_track_array[j].add_falling_note(note_type_string_array[note_map_resource_array[i].note_type_up])
			if j == 2:
				note_track_array[j].add_falling_note(note_type_string_array[note_map_resource_array[i].note_type_down])
			if j == 3:
				note_track_array[j].add_falling_note(note_type_string_array[note_map_resource_array[i].note_type_right])
	
	for i in range(4):
		note_track_array[i].start_note_track()
