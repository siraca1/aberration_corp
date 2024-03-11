class_name AutoMove
extends Node3D


@export var target: Node3D = null
@export var speed: Vector3 = Vector3.FORWARD


func _physics_process(delta: float) -> void:
	if target:
		target.translate(basis.x * speed.x * delta + basis.y * speed.y * delta + basis.z * speed.z * delta)
	else:
		self.translate(basis.x * speed.x * delta + basis.y * speed.y * delta + basis.z * speed.z * delta)
