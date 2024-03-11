class_name GameOverScreen
extends Control


@export var display_time: float = 5.0


@onready var game_over_label: Label = $GameOverLabel


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	await get_tree().create_timer(display_time - 2.0).timeout
	await get_tree().create_tween().tween_property(game_over_label, "color:a", 0.0, 2.0)
	GameManager.go_to_main()
