extends Node2D

@export var speed: float = 600
@onready var explosion = preload("res://scenes/explosion.tscn")

func  _ready():
	await get_tree().create_timer(2.0).timeout
	queue_free()

func _process(delta):
	position.y -= speed * delta

func DestroyShip(body):
	var exploaionCopy=explosion.instantiate()
	exploaionCopy.position = body.position
	get_tree().get_root().add_child(exploaionCopy)
	body.queue_free()
	await get_tree().create_timer(0.5).timeout
	exploaionCopy.queue_free()
	
	queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		DestroyShip(body)
		await get_tree().create_timer(0.1).timeout
		var Enemies=get_tree().get_nodes_in_group("Enemy")
		if Enemies.size() == 0:
			get_tree().get_first_node_in_group("WinPannel").visible = true
	
	elif  body.is_in_group("Player"):
		DestroyShip(body)
		get_tree().get_first_node_in_group("LosePannel").visible = true

