extends Control

export (Texture) var button_eight
export (Texture) var button_A
export (Texture) var button_B
export (Texture) var button_P
export (Texture) var button_X

var options = ["8","A","B","P","X"]
var current_left: String
var current_right: String

onready var buttons = {"8":button_eight,
					   "A":button_A,
					   "B":button_B,
					   "P":button_P,
					   "X":button_X}


func show_buttones(left,right) -> void:
	$HBoxContainer/Left/Button.texture = buttons[left]
	$HBoxContainer/Right/Button.texture = buttons[right]
