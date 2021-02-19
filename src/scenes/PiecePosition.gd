extends Position3D

export (PackedScene) var StraightPiece
export (PackedScene) var blockvar1
export (PackedScene) var blockvar2
export (PackedScene) var blockvar3
export (PackedScene) var blockvar4
export (PackedScene) var blockvar5
export (PackedScene) var blockvar6

var rng = RandomNumberGenerator.new()

onready var blocks = [StraightPiece,blockvar1,blockvar2,blockvar3,blockvar4,blockvar5,blockvar6]

func _ready():
	rng.randomize()

func generate_block() -> void:
	var num = rng.randi_range(0,blocks.size()-1)
	var kids = get_children()
	for kid in kids:
		kid.queue_free()
	var new_block = blocks[num].instance()
	new_block.global_transform.origin = global_transform.origin
	add_child(new_block)
