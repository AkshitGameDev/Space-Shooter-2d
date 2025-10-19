extends Node2D

@export var speed: float = 400

func  _ready():
	await get_tree().create_timer(2.0).timeout
	queue_free()

func _process(delta):
	position.y -= speed * delta
	
