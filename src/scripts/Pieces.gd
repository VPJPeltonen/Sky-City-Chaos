extends Spatial

onready var blockSpots = [$PiecePosition,$PiecePosition2,$PiecePosition3,$PiecePosition4,$PiecePosition5]

func _ready():
	generate_map()
	
func generate_map() -> void:
	for block in blockSpots:
		block.generate_block()

func _on_Porter_loop_done():
	generate_map()
