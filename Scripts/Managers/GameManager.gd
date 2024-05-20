class_name GameManager extends Node

var fade_duration: float = 3.0  # Time for the fade-out effect
var time_elapsed: float
signal isBossSignal

#Background
@onready var bg = $ScrollingBackground
@export var bg_scroll_speed = 100

@onready var bg2 = $ScrollingBackground2
@export var bg_scroll_speed2 = 100

@onready var bg3 = $ScrollingBackground3
@export var bg_scroll_speed3 = 100

@onready var bg4 = $ScrollingBackground4
@export var bg_scroll_speed4 = 100

#EnemyManager
@export var enemy_scenes: Array[PackedScene] = []
@export var enemy_spawn_timer = 0
@export var max_enemies = 30  # New: Maximum number of enemies
@onready var enemy_container = $EnemyContainer

@export var enemy_scenes2: Array[PackedScene] = []  # Secondary enemy scenes
@onready var enemy_spawn_timer2: Timer = $EnemySpawnTimer2  # Secondary enemy timer
@export var max_enemies2 = 30  # New: Maximum number of enemies
@onready var enemy_container2 = $EnemyContainer2
@onready var secondary_frequency_timer = $EnemyFrequencyTimer2
var secondary_wave_active = false  # Boolean flag


#MoolaSpawner
@export var moola_scenes: Array[PackedScene] = []
@export var moola_spawn_timer = 0
@onready var moola_container = $MoolaContainer


#Grab the HUD
@onready var hud = $GeneralUI/HUD
@onready var game_over_screen = $GeneralUI/GameOverMenu

#Pause Menu
@onready var pause_menu = $GeneralUI/PauseMenu

# Reference to the player character and their spawn
@onready var player_spawn_point = $playerSpawn
@onready var projectile_container = $ProjectileContainer
var player = Protoship
@onready var player_controller = Protoship.get_script()

@onready var paths: Node2D = $Paths

var score := 0:
	set(value):
		score = value
		hud.score = score

#Boss logic
@onready var boss_timer: Timer = $BossTimer
@onready var boss_marker: Marker2D = $BossSpawn
@export var boss_scene: PackedScene#Export to expose in Inspector
var isBoss := false
@onready var boss_name: CanvasLayer = $BossCanvas
@onready var boss_container: Node2D = $BossContainer
@export var is_pathed_boss := false  # New flag for pathed bosses
@onready var boss_path: Node2D = $BossPath
@onready var boss_path_spawner: Path2D = $BossPath/Boss
@export var data_key: PackedScene  # The packed scene for your data core
@export var noBoss := false  # New variable to control boss spawning





func _ready():
	var _save_file = FileAccess.open("user://save.data", FileAccess.READ)
	enemy_spawn_timer = $EnemySpawnTimer
	moola_spawn_timer = $MoolaSpawnTimer
	score = 0
	player.global_position = player_spawn_point.global_position
	player.dead.connect(_on_player_dead)
	player.heal(-1)
	game_over_screen.set_process(false)
	hud.visible = false
	boss_name.set_process(false)
	boss_name.visible = false
	boss_path.set_physics_process(false)
	boss_path_spawner.set_physics_process(false)
	pause_menu.visible = false
	pause_menu.set_process(false) # Ensure the pause menu is hidden initially
	# Boss Timer Setup
	boss_timer.one_shot = true  # Make the timer run only once
	if not isBoss and enemy_container.get_child_count() < max_enemies:  # Check if below cap
		enemy_spawn_timer.start()  # Only start timer if needed
		enemy_spawn_timer2.start()
		secondary_frequency_timer.stop()
	else:
		enemy_spawn_timer.stop() 
	if player_controller:  # Check if PlayerController exists
		player = Protoship  # Get the Protoship node
		player.global_position = player_spawn_point.global_position
		player.set_process(true)
		player.set_physics_process(true)
		player.visible = true
	else:
		print("Error: PlayerController script not found on Protoship.")
	if not is_pathed_boss:
		boss_path.queue_free()
		boss_path_spawner.queue_free()
	if not is_pathed_boss:
		boss_path.queue_free()
		boss_path_spawner.queue_free()

func _on_boss_timer_timeout():

	# Destroy all enemies
	for child in enemy_container.get_children():
		child.queue_free()
	for child in enemy_container2.get_children():
		child.queue_free()
	for child in paths.get_children():
			child.queue_free()
	# Spawn the boss 
	if noBoss:
		_spawn_data_core()
	elif is_pathed_boss: # Check if it's a pathed boss
		boss_path.set_process(true) # Activate the boss_path node's processing
		boss_path_spawner.set_process(true)
	else: # Standard boss spawning
		var boss = boss_scene.instantiate()
		boss.defeated.connect(_on_enemy_killed)
		boss.global_position = boss_marker.global_position
		boss_container.add_child(boss)
		paths.queue_free()  # Free up the paths Node2D if not using it
	boss_name.set_process(true) 
	boss_name.visible = true
	isBoss = true
	emit_signal("isBossSignal")

func _on_enemy_spawn_timer2_timeout():  # New function for secondary enemies
	if not isBoss and enemy_container2.get_child_count() < max_enemies2:
		secondary_wave_active = true
		var e = enemy_scenes2.pick_random().instantiate()
		e.global_position = Vector2(randf_range(60, 580), randf_range(-20, -10))
		e.defeated.connect(_on_enemy_killed)
		enemy_container2.add_child(e)
		secondary_frequency_timer.start()



func _process(delta):
	if enemy_spawn_timer.wait_time > 0.35:
		enemy_spawn_timer.wait_time -= delta*0.09
	elif enemy_spawn_timer.wait_time < 0.35:
				enemy_spawn_timer.wait_time = 0.35
	if secondary_wave_active:
		if secondary_frequency_timer.wait_time > 0.4:
			secondary_frequency_timer.wait_time -= delta*0.09
		elif secondary_frequency_timer.wait_time < 0.4:
				secondary_frequency_timer.wait_time = 0.4
	if not isBoss:
		bg.scroll_offset.y += delta*bg_scroll_speed
		if bg.scroll_offset.y >= 400:
			bg.scroll_offset.y = 0
		
		bg2.scroll_offset.y += delta*bg_scroll_speed2
		if bg2.scroll_offset.y >= 400:
			bg2.scroll_offset.y = 0
			
		bg3.scroll_offset.y += delta*bg_scroll_speed3
		if bg3.scroll_offset.y >= 400:
			bg3.scroll_offset.y = 0
			
		bg4.scroll_offset.y += delta*bg_scroll_speed4
		if bg4.scroll_offset.y >= 400:
			bg4.scroll_offset.y = 0



	if Input.is_action_just_pressed("esc"):
		pause_menu.set_process(true)
		get_tree().paused = not get_tree().paused#Toggle pause state
		pause_menu.visible = get_tree().paused

	if Input.is_action_just_pressed("esc") and isBoss:
		boss_name.set_process(false)
		boss_name.visible = false

	if isBoss:  # Clear enemies if boss battle is active
		for child in enemy_container.get_children():
			child.queue_free()
		
	
	







func _on_enemy_spawn_timer_timeout():
	if not isBoss and enemy_container.get_child_count() < max_enemies:  # Double-check
		var e = enemy_scenes.pick_random().instantiate()
		e.global_position = Vector2(randf_range(60, 580), randf_range(-20, -10))
		e.defeated.connect(_on_enemy_killed)
		enemy_container.add_child(e)

func _on_enemy_killed(points):
	score += points
	if is_pathed_boss and isBoss:  
		# Only check this condition if a pathed boss is defeated
		_spawn_data_core()
		
func _spawn_data_core():
	# Instantiate the data core scene
	var data_core = data_key.instantiate()

	# Set the position of the data core to where the enemy was defeated
	data_core.global_position = boss_marker.global_position # Get the Vector2 from the boss_marker
	$DataKeyContainer.call_deferred("add_child", data_core) 

func _on_player_dead():
	boss_name.set_process(false)
	boss_name.visible = false
	game_over_screen.set_process(true)
	game_over_screen.set_score(score)
	await get_tree().create_timer(1.5).timeout
	game_over_screen.visible = true
	


func _on_moola_spawn_timer_timeout():
	if not isBoss:  # Check if a boss is NOT present
		var m = moola_scenes.pick_random().instantiate()
		m.global_position = Vector2(randf_range(80, 560), randf_range(-20, -10))
		moola_container.add_child(m)



func _on_game_over_menu_to_main_menu():
	get_tree().change_scene_to_file("res://Scenes/Levels/MainMenu/main_menu_scene.tscn")
	game_over_screen.set_process(false)
	game_over_screen.visible = false


func _on_pause_menu_redirect_quit():
	print ("pause pressed")
	get_tree().paused = false

	get_tree().change_scene_to_file("res://Scenes/Levels/MainMenu/main_menu_scene.tscn")
	


func _on_pause_menu_game_unpaused():
	if isBoss:
		boss_name.visible = true
		boss_name.set_process(true)




func _on_enemy_frequency_timer2_timeout():  # New function for frequency control
	if not isBoss and enemy_container2.get_child_count() < max_enemies2 and secondary_wave_active:
		# Spawn a secondary enemy (use same logic as in _on_enemy_spawn_timer2_timeout)
		var e = enemy_scenes2.pick_random().instantiate()
		e.global_position = Vector2(randf_range(60, 580), randf_range(-20, -10))
		e.defeated.connect(_on_enemy_killed)
		enemy_container2.add_child(e)

		# Reset the frequency timer to continue spawning
		secondary_frequency_timer.start()  


func _on_game_over_menu_restart():
	game_over_screen.set_process(false)
	game_over_screen.visible = false
	player.heal(-1)
	get_tree().reload_current_scene()
