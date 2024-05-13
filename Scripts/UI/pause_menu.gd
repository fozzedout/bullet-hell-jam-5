extends CanvasLayer

signal RedirectQuit

func resume():
	get_tree().paused = false

func pause():
	get_tree().paused = true

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif  Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()


func _on_continue_button_pressed():
	resume()

func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()


func _process(_delta):
	testEsc()

	# Toggle pause menu visibility based on game state
	if get_tree().paused:
		self.visible = true
	else:
		self.visible = false


func _on_menu_pressed():
	resume()
	RedirectQuit.emit()
