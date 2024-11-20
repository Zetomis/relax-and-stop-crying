extends Control
class_name GameUI

@onready var combo_label: Label = %ComboLabel
@onready var combo_label_animation_player: AnimationPlayer = %ComboLabelAnimationPlayer

func _ready() -> void:
	SignalBus.trigger_combo_label.connect(_on_trigger_combo_label)
	combo_label.hide()

func _on_trigger_combo_label(text: String) -> void:
	combo_label.text = text
	
	if combo_label_animation_player.is_playing():
		combo_label_animation_player.stop()
	
	combo_label_animation_player.play("combo_text_fade")
