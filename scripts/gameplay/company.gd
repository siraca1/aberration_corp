class_name Company
extends Node3D


@export var default_offices: Array[OfficeData]
@export var layout_spacing: float = 0.5
@export var links_holder: Node3D = null


var office_scene: PackedScene = preload(GlobalConstants.SCENE_OFFICE)
var link_scene: PackedScene = preload(GlobalConstants.SCENE_LINK)
var current_offices: Array[Office]


func _ready() -> void:
	for office in default_offices.size():
		var new_instance = office_scene.instantiate() as Office
		new_instance.setup(default_offices[office])
		add_child(new_instance)
		current_offices.append(new_instance)
		update_struture()


func update_struture() -> void:
	reframe_all()
	create_links()


func reframe_all() -> void:
	for office in current_offices.size():
		var index:float = office as float / default_offices.size() as float
		current_offices[office].position = Vector3(index * default_offices[office].size.x * 2.0 + index * layout_spacing, 0, 0)


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
