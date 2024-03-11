class_name Office
extends Area3D


@export var slot_holder: Node3D


var slot_scene: PackedScene = preload(GlobalConstants.SCENE_SLOT)
var current_slots: Array[Slot]
var office_data: OfficeData


func setup(input_office_data: OfficeData) -> void:
	office_data = input_office_data
	for office in office_data.slots_number:
		var new_instance = slot_scene.instantiate() as Slot
		slot_holder.add_child(new_instance)
		current_slots.append(new_instance)
		new_instance.position = Vector3((office as float / office_data.slots_number as float) * 0.5, 0, 0)


func _process(_delta: float) -> void:
	pass
