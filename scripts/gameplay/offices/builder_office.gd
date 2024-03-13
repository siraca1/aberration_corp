extends Node3D


@onready var office: Office = $".."
@onready var product_scene: PackedScene = preload(GlobalConstants.SCENE_PRODUCT)


var slots: Array[Slot]


func spawn_product() -> void:
	for slot in slots:
		if not slot.content:
			var product := product_scene.instantiate() as Product
			product.setup(false)
			slot.add_child(product)
			slot.content = product


func _ready() -> void:
	slots = office.current_slots
