class_name Draggable
extends Area3D


@export var node_to_move: Node3D = null


var is_dragging: bool = false


func setup(node: Node3D) -> void:
	node_to_move = node


func begin_drag() -> bool:
	if is_dragging:
		return false
	
	is_dragging = true
	return true


func end_drag() -> bool:
	if not is_dragging or not _can_drop():
		return false
	
	is_dragging = false
	return true


func _physics_process(_delta: float) -> void:
	if is_dragging:
		var space_state = get_world_3d().direct_space_state
		var cam = Utils.main_camera
		var mousepos = get_viewport().get_mouse_position()
		
		var origin = cam.project_ray_origin(mousepos)
		var end = origin + cam.project_ray_normal(mousepos) * GlobalConstants.CAMERA_RAY_LENGTH
		var query = PhysicsRayQueryParameters3D.create(origin, end)
		query.collide_with_areas = true
		
		var result = space_state.intersect_ray(query)
		node_to_move.global_position = result.position


func _can_drop() -> bool:
	return true


func _on_input_event(_camera: Node, _event: InputEvent, _position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	print("input event !")
	if not begin_drag():
		end_drag()
