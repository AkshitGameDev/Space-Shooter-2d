extends CharacterBody2D

var movementVector 
@export var Speed: float = 200
@onready var Bolt = preload("res://scenes/bolt.tscn")

func _physics_process(delta):
	movementVector= Vector2(Input.get_axis("left","right"),
	Input.get_axis("forward","back")
	)
	print(movementVector)
	velocity=movementVector.normalized() * Speed
	move_and_slide()
	
	if Input.is_action_just_pressed("space"):
		var BoltCopy = Bolt.instantiate()
		BoltCopy.position=position
		get_tree().get_root().add_child(BoltCopy)
	
