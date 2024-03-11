class_name Spawner
extends Node3D


@export var object_to_spawn: PackedScene = null
@export_range(0.1, 100.0) var spawn_rate: float = 1.0
@export var spawn_random: float = 0.0
@export var spawn_on_ready: bool = false
@export var spawn_as_child: bool = false
@export var object_lifetime: float = -1.0


var enable_spawn: bool = false


var _awaiting: bool = false


signal object_spawned(object: Object)


func _ready() -> void:
	if spawn_on_ready:
		enable_spawn = true
		spawn()


func spawn() -> void:
	if _awaiting or not enable_spawn or not object_to_spawn:
		return
	
	var new_object = object_to_spawn.instantiate() as Node3D
	
	if spawn_as_child:
		add_child(new_object)
	else:
		get_tree().current_scene.add_child(new_object)
	
	new_object.transform = self.global_transform
	new_object.name = self.name + "_" + object_to_spawn.resource_name
	
	# does not work
	#if object_lifetime > 0.0 and new_object.has_node("SmartTimer"):
		#new_object.get_node("SmartTimer").wait_time = object_lifetime
	
	object_spawned.emit(new_object)
	
	var time_to_wait: float = (1.0 / max(0.1, spawn_rate)) + randf_range(-spawn_random, spawn_random)
	_awaiting = true
	await get_tree().create_timer(max(0.1, time_to_wait)).timeout
	_awaiting = false
	
	spawn()
