extends Node2D


func _ready():
	# Access the autoloaded Protoship node
	var player = Protoship

	# Disable physics processing and visibility
	player.set_physics_process(false) 
	player.visible = false


