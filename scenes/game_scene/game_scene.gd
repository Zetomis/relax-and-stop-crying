extends Node
class_name GameScene

@onready var falling_note_feeder: FallingNoteFeeder = %FallingNoteFeeder

func _ready() -> void:
	falling_note_feeder.feed_note_map()
