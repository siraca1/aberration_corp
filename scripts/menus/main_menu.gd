class_name MainMenu
extends Control


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_play_button_pressed() -> void:
	GameManager.start_game()


func _on_quit_button_pressed() -> void:
	GameManager.quit_game()
