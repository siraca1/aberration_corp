class_name Product
extends RigidBody3D

@export var draggable: Draggable = null
@export var broken_particles: GPUParticles3D = null


func setup(broken: bool) -> void:
	broken_particles.emitting = broken


func _input(event) -> void:
	if draggable and event is InputEventMouseButton and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		DragSnap.start_drag(Utils.main_camera, self)
