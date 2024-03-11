extends Node


var main_camera: Camera3D: get = _get_main_camera


func set_parent(node: Node, new_parent: Node = null, reset_position: bool = false) -> void:
	if not node:
		return
	
	var original_parent = node.get_parent()
	
	if original_parent:
		original_parent.remove_child(node)
	
	if new_parent:
		new_parent.add_child(node)
	else:
		get_tree().current_scene.add_child(node)
	
	if not node is Node3D:
		return
	
	if reset_position:
		node.transform = new_parent.transform if new_parent else node.transform
	else:
		node.transform = original_parent.transform if original_parent else node.transform


func get_sibling(node: Node, sibling: String) -> Node:
	if not node.get_parent():
		return null
	
	if not get_parent().has_node(sibling):
		return null
		
	return get_parent().get_node(sibling)


func tween_hovering_effect(node: Node3D, value: float, time: float) -> Tween:
	if not node:
		return null
	
	var tween = get_tree().create_tween()
	tween.bind_node(node)
	tween.set_loops().set_trans(Tween.TRANS_SINE)
	tween.tween_property(node, "position:y", node.position.y + value, time * 0.5)
	tween.chain().tween_property(node, "position:y", node.position.y - value, time * 0.5)
	
	return tween


func _get_main_camera() -> Camera3D:
	if not main_camera:
		main_camera = get_tree().get_first_node_in_group("MainCameras")
	
	return main_camera
