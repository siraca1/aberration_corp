extends Node


var game_pause: bool = false

var _navigation_scene:PackedScene = preload(GlobalConstants.SCENE_NAVIGATION)
var _navigation: Navigation: set = _set_navigation, get = _get_navigation


func go_to_main() -> void:
	_navigation.go_to(GlobalConstants.SCENE_MAIN_MENU)


func start_game() -> void:
	_navigation.go_to(GlobalConstants.SCENE_WORLD)


func quit_game() -> void:
	get_tree().quit()


func end_game(game_over: bool) -> void:
	if game_over:
		_navigation.go_to(GlobalConstants.SCENE_GAME_OVER)
	else:
		_navigation.go_to(GlobalConstants.SCENE_GAME_END)


func get_office_database(index: int) -> OfficeData:
	var all_offices:= GlobalConstants.DATA_OFFICE.load_all()
	
	if index >= all_offices.size():
		return null
	
	return all_offices[index] as OfficeData


func _set_navigation(new_navigation: Navigation) -> void:
	_navigation = new_navigation


func _get_navigation() -> Navigation:
	if _navigation:
		return _navigation
		
	var new_nav = _navigation_scene.instantiate()
	add_child(new_nav)
	_navigation = new_nav as Navigation
	return _navigation
