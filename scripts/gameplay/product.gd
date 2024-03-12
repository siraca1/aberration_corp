class_name Product
extends RigidBody3D

@onready var draggable: Draggable = $Draggable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _input(event) -> void:
	if draggable and event is InputEventMouseButton and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		DragSnap.start_drag(Utils.main_camera, self)
