class_name GameEndScreen
extends Control


@onready var credits_label: Label = $CreditsLabel


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	for line in GlobalConstants.MISC_CREDITS:
		credits_label.text = line
		await get_tree().create_timer(1.0).timeout
	
	GameManager.go_to_main()
