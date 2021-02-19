extends Control

export (Texture) var button_eight
export (Texture) var button_A
export (Texture) var button_B
export (Texture) var button_P
export (Texture) var button_X

var rng = RandomNumberGenerator.new()
var options = ["8","A","B","P","X"]
var current_left: int
var current_right: int

onready var buttons = {"8":button_eight,
					   "A":button_A,
					   "B":button_B,
					   "P":button_P,
					   "X":button_X}


func _ready():
	rng.randomize()
	generate_keys()

func generate_keys()-> void:
	current_left = rng.randi_range(0,options.size()-1)
	while true:
		current_right = rng.randi_range(0,options.size()-1)
		if current_right != current_left:
			show_buttons(options[current_left],options[current_right])
			return

func show_buttons(left,right) -> void:
	$HBoxContainer/Left/Button.texture = buttons[left]
	$HBoxContainer/Right/Button.texture = buttons[right]

func new_buttons():
	generate_keys()
