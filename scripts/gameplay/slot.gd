class_name Slot
extends Area3D


var content


func _on_snap_point_snaped_object(object: Variant) -> void:
	content = object


func _on_snap_point_unsnaped_object(object: Variant) -> void:
	content = null
