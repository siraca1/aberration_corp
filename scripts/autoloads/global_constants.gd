extends Node

#region SCENES
const SCENE_NAVIGATION: String = "res://scenes/autoloads_children/navigation.tscn"
const SCENE_MAIN_MENU: String = "res://scenes/menus/main_menu.tscn"
const SCENE_GAME_OVER: String = "res://scenes/menus/game_over_screen.tscn"
const SCENE_GAME_END: String = "res://scenes/menus/game_end_screen.tscn"
const SCENE_WORLD: String = "res://scenes/world.tscn"
const SCENE_OFFICE: String = "res://scenes/gameplay/office.tscn"
const SCENE_LINK: String = "res://scenes/gameplay/link.tscn"
const SCENE_SLOT: String = "res://scenes/gameplay/slot.tscn"
const SCENE_PRODUCT: String = "res://scenes/gameplay/product.tscn"
#endregion

#region MISC
const MISC_CREDITS: Array = ["THE END", "a game by Siraca", "Thanks for playing"]
const MISC_OFFICES_SIZE: float = 0.5
#endregion

#region DATA
const DATA_OFFICE = preload("res://resources/office_data.tres")
#endregion
