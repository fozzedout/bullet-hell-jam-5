class_name GalaxyMap extends Node2D

@onready var corner_buttons: Control = $"UI/Control/Corner Buttons"
@onready var settings_menu: Control = $"UI/Settings Menu"



#Levels revised
@onready var level_1: Button = $UI/Levels/Level1
@onready var level_2: Button = $UI/Levels/Level2
@onready var level_3: Button = $UI/Levels/Level3
@onready var level_4: Button = $UI/Levels/Level4
@onready var level_5: Button =$UI/Levels/Level5
@onready var level_6: Button =$UI/Levels/Level6
@onready var level_7: Button =$UI/Levels/Level7
@onready var level_8: Button =$UI/Levels/Level8
@onready var level_9: Button =$UI/Levels/Level9
@onready var level_10: Button =$UI/Levels/Level10
@onready var level_11: Button =$UI/Levels/Level11
@onready var level_12: Button =$UI/Levels/Level12
@onready var level_13: Button =$UI/Levels/Level13
@onready var level_14: Button =$UI/Levels/Level14
@onready var level_15: Button =$UI/Levels/Level15


var player = Protoship
@onready var player_data = Protoship.get_script()
@onready var path_follow: PathFollow2D = $Path2D/PathFollow2D 


func _ready():
	corner_buttons.visible = true
	corner_buttons.set_process(true)
	settings_menu.visible = false
	settings_menu.set_process(false)
	disable_player()  # Disable player initially
	level_1.set_process(false)
	level_1.visible = false
	level_2.set_process(false)
	level_2.visible = false
	level_3.set_process(false)
	level_3.visible = false
	level_4.set_process(false)
	level_4.visible = false
	level_5.set_process(false)
	level_5.visible = false
	level_6.set_process(false)
	level_6.visible = false
	level_7.set_process(false)
	level_7.visible = false
	level_8.set_process(false)
	level_8.visible = false
	level_9.set_process(false)
	level_9.visible = false
	level_10.set_process(false)
	level_10.visible = false
	level_11.set_process(false)
	level_11.visible = false
	level_12.set_process(false)
	level_12.visible = false
	level_13.set_process(false)
	level_13.visible = false
	level_14.set_process(false)
	level_14.visible = false
	level_15.set_process(false)
	level_15.visible = false
	update_path_position()

func disable_player():
	if player: # Check if player node was obtained successfully
		player.set_physics_process(false) 
		player.visible = false
		print("Player deactivated in Galaxy Map")


func reactivate_player():
	if player:
		player.set_physics_process(true)
		player.visible = true
		print("Player reactivated")

func _process(_delta):
	if Input.is_action_just_pressed("esc"):  
		Protoship.datakeys_collected += 1
		update_path_position()
		print("Datakeys: ", Protoship.datakeys_collected)

func update_path_position():
	if player_data:
		match Protoship.datakeys_collected: # Match case based on number of datakeys
			0:
				path_follow.progress_ratio = 0.0 
				level_1.set_process(true)
				level_1.visible = true
			1:
				path_follow.progress_ratio = 0.058
				level_1.set_process(false)
				level_1.visible = false
				level_2.set_process(true)
				level_2.visible = true
			2:
				path_follow.progress_ratio = 0.107
				level_2.set_process(false)
				level_2.visible = false
				level_3.set_process(true)
				level_3.visible = true
			3:
				path_follow.progress_ratio = 0.203
				level_3.set_process(false)
				level_3.visible = false
				level_4.set_process(true)
				level_4.visible = true
			4:
				path_follow.progress_ratio = 0.347
				level_4.set_process(false)
				level_4.visible = false
				level_5.set_process(true)
				level_5.visible = true
			5:
				path_follow.progress_ratio = 0.41
				level_5.set_process(false)
				level_5.visible = false
				level_6.set_process(true)
				level_6.visible = true
			6:
				path_follow.progress_ratio = 0.495
				level_6.set_process(false)
				level_6.visible = false
				level_7.set_process(true)
				level_7.visible = true
			7:
				path_follow.progress_ratio = 0.531
				level_7.set_process(false)
				level_7.visible = false
				level_8.set_process(true)
				level_8.visible = true
			8:
				path_follow.progress_ratio = 0.585
				level_8.set_process(false)
				level_8.visible = false
				level_9.set_process(true)
				level_9.visible = true
			9:
				path_follow.progress_ratio = 0.639
				level_9.set_process(false)
				level_9.visible = false
				level_10.set_process(true)
				level_10.visible = true
			10:
				path_follow.progress_ratio = 0.742
				level_10.set_process(false)
				level_10.visible = false
				level_11.set_process(true)
				level_11.visible = true
			11:
				path_follow.progress_ratio = 0.819
				level_11.set_process(false)
				level_11.visible = false
				level_12.set_process(true)
				level_12.visible = true
			12:
				path_follow.progress_ratio = 0.9
				level_12.set_process(false)
				level_12.visible = false
				level_13.set_process(true)
				level_13.visible = true
			13:
				path_follow.progress_ratio = 0.94
				level_13.set_process(false)
				level_13.visible = false
				level_14.set_process(true)
				level_14.visible = true
			14:
				path_follow.progress_ratio = 1
				level_14.set_process(false)
				level_14.visible = false
				level_15.set_process(true)
				level_15.visible = true


func _on_to_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/MainMenu/main_menu_scene.tscn")

func _on_settings_pressed():
	corner_buttons.visible = false
	corner_buttons.set_process(false)
	settings_menu.visible = true
	settings_menu.set_process(true)

func _on_back_button_settings_pressed():
	settings_menu.visible = false
	settings_menu.set_process(false)
	corner_buttons.visible = true
	corner_buttons.set_process(true)

func _on_to_garage_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/Shop/shop.tscn")



func _on_level_1_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level1.tscn") 



func _on_level_2_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level2.tscn") 




func _on_level_3_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level3.tscn") 


func _on_level_4_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level4.tscn") 



func _on_level_5_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level5.tscn") 



func _on_level_6_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level6.tscn") 


func _on_level_7_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level7.tscn") 


func _on_level_8_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level8.tscn") 


func _on_level_9_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level9.tscn") 


func _on_level_10_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/MainMenu/main_menu_scene.tscn") 


func _on_level_11_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level11.tscn") 


func _on_level_12_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level12.tscn") 


func _on_level_13_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level13.tscn") 


func _on_level_14_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/test_level14.tscn") 


func _on_level_15_pressed():
	reactivate_player()  # Enable the player (if needed)
	get_tree().change_scene_to_file("res://Scenes/Levels/level15.tscn") 
