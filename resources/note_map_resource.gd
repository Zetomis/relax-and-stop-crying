extends Resource
class_name NoteMapResource

enum NoteType {
	SINGLE,
	NULL
}

@export var note_type_left: NoteType = NoteType.NULL
@export var note_type_up: NoteType = NoteType.NULL
@export var note_type_down: NoteType = NoteType.NULL
@export var note_type_right: NoteType = NoteType.NULL
