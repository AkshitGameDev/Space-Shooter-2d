extends Node2D
var speed:float = 100
@onready var backgrounds = [$BG,$BG2,$BG3]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in backgrounds.size():
		backgrounds[i].position.y += speed * delta
		if backgrounds[i].position.y>= 1460:
			backgrounds[i].position.y = -1585
