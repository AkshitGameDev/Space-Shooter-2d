extends CharacterBody2D

@export var speed: float = 200
var movementVector: Vector2 = Vector2(1,0)

@onready var crossed = preload("res://scenes/crossed.tscn")

var timerToSHoot: float
@export var timeToLoadBullet: float = 3
@export var Chance: int=3

func _ready():
	timerToSHoot = randf_range(-1 , timeToLoadBullet)

func _physics_process(delta):
	if position.x >= 1100:
		movementVector.x = -1
	elif position.x <= 52:
		movementVector.x = 1
	velocity = movementVector * speed
	move_and_slide()
	
	if timerToSHoot > timeToLoadBullet:
		timerToSHoot = 0
		var rng = randi_range(0,Chance)
		if rng == 0:
			var crossedCopy = crossed.instantiate()
			crossedCopy.position = position
			crossedCopy.position.y += 50
			get_tree().get_root().add_child(crossedCopy)
	else:
		timerToSHoot+=delta
	
	
