extends Spatial

export (PackedScene) var level


func _on_Button_pressed():
	$MainMenu.hide()
	GAME.running = true
