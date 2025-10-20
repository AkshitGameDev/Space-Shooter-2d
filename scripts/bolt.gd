extends Node2D

@export var speed: float = 400
@onready var explosion = preload("res://scenes/explosion.tscn")

func  _ready():
	await get_tree().create_timer(2.0).timeout
	queue_free()

func _process(delta):
	position.y -= speed * delta

func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy") or body.is_in_group("Player") :
		var exploaionCopy=explosion.instantiate()
		exploaionCopy.position = body.position
		get_tree().get_root().add_child(exploaionCopy)
		body.queue_free()
		await get_tree().create_timer(0.5).timeout
		exploaionCopy.queue_free()
	
	

