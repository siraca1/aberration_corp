class_name Navigation
extends Node


@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var background_color_rect: ColorRect = $CanvasLayer/BackgroundColorRect
@onready var loading_label: Label = $CanvasLayer/LoadingLabel


const prop_color_a: String = "color:a"


func go_to(scene:String) -> void:
	canvas_layer.visible = true
	loading_label.visible = false
	
	await get_tree().create_tween().tween_property(background_color_rect, prop_color_a, 1.0, 0.25).from(0.0).finished
	loading_label.visible = true
	
	get_tree().change_scene_to_file(scene)
	
	loading_label.visible = false
	await get_tree().create_tween().tween_property(background_color_rect, prop_color_a, 0.0, 0.25).from(1.0).finished
	canvas_layer.visible = false
