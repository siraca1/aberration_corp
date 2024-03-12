class_name Company
extends Node3D


@export var default_offices: Array[OfficeData]
@export var layout_spacing: float = 0.5
@export var links_holder: Node3D = null

@export_subgroup("Bounds")
@export var bound_minus_x: Node3D = null
@export var bound_plus_x: Node3D = null
@export var bound_minus_z: Node3D = null
@export var bound_plus_z: Node3D = null


var office_scene: PackedScene = preload(GlobalConstants.SCENE_OFFICE)
var link_scene: PackedScene = preload(GlobalConstants.SCENE_LINK)
var current_offices: Array[Office]


func add_office(office: OfficeData = null) -> void:
	if not office:
		office = GameManager.get_office_database(current_offices.size());
	if not office:
		GameManager.end_game(false)
		return
	
	var new_instance = office_scene.instantiate() as Office
	new_instance.setup(office)
	add_child(new_instance)
	current_offices.append(new_instance)
	update_struture()
	print("adding office")


func update_struture() -> void:
	reframe_all()
	create_links()


func reframe_all() -> void:
	var bounds: Vector4
	for i in current_offices.size():
		var index:float = i as float / default_offices.size() as float
		current_offices[i].position = Vector3(index * current_offices[i].office_data.size.x * 2.0 + index * layout_spacing, 0, 0)
		bounds = _update_bounds_data(bounds, current_offices[i].global_position)
	_update_bounds_positions(bounds)


func create_links() -> void:
	for child in links_holder.get_children():
		child.queue_free()
	
	for office in current_offices.size() - 1:
		var current_office:Office = current_offices[office] as Office
		var new_link = link_scene.instantiate() as Node3D
		links_holder.add_child(new_link)
		new_link.position = current_office.position + Vector3.RIGHT * current_office.office_data.size.x * 0.5
		new_link.scale = Vector3(layout_spacing, 1.0, 1.0)
		new_link.look_at(current_offices[office + 1].position)


func _ready() -> void:
	for office in default_offices:
		add_office(office)


func _update_bounds_data(bounds: Vector4, new_vector: Vector3) -> Vector4:
	return Vector4(
		new_vector.x if new_vector.x < bounds.x else bounds.x, 
		new_vector.x if new_vector.x > bounds.y else bounds.y, 
		new_vector.z if new_vector.z < bounds.z else bounds.z, 
		new_vector.z if new_vector.z > bounds.w else bounds.w)


func _update_bounds_positions(bounds: Vector4) -> void:
	bound_minus_x.global_position.x = bounds.x
	bound_plus_x.global_position.x = bounds.y
	bound_minus_x.global_position.z = bounds.z
	bound_plus_x.global_position.z = bounds.w
