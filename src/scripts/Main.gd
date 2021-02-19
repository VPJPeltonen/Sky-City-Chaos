extends Spatial

export (PackedScene) var level

func game_over():
	GAME.running = false
	$GameOver.show()

func _on_Button_pressed():
	$MainMenu.hide()
	GAME.running = true

func _on_RestartButton_pressed():
	var kids = $LevelHolder.get_children()
	for kid in kids:
		kid.queue_free()
	var newgame = level.instance()
	$LevelHolder.add_child(newgame)
	$GameOver.hide()
	$MainMenu.show()
