class_name Office
extends Area3D


@export var slot_holder: Node3D = null
@export var title_label: Label3D = null


var slot_scene: PackedScene = preload(GlobalConstants.SCENE_SLOT)
var current_slots: Array[Slot]
var office_data: OfficeData


func setup(input_office_data: OfficeData) -> void:
	office_data = input_office_data
	
	if title_label:
		title_label.text = office_data.name
		
	for slot in office_data.slots_number:
		var new_instance = slot_scene.instantiate() as Slot
		slot_holder.add_child(new_instance)
		current_slots.append(new_instance)
		new_instance.position = Vector3((slot as float / office_data.slots_number as float) * 0.5, 0, 0)
