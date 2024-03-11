class_name Slot
extends Area3D


var content


func get_content():
	if content:
		return content


func set_content(new_content) -> bool:
	if content:
		return false
	
	content = new_content
	return true
