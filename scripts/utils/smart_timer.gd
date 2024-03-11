class_name SmartTimer
extends Timer


@export var target_node: Node = null
@export var target_method: String = ""


func _on_timeout() -> void:
	if not target_node or target_method.is_empty():
		return
	
	if not target_node.has_method(target_method):
		return
	
	target_node.call(target_method)
