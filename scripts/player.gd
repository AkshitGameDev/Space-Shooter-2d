extends CharacterBody2D

var movementVector 
@export var Speed: float = 200

func _physics_process(delta):
	movementVector= Vector2(Input.get_axis("left","right"),Input.get_axis("forward","back")
	)
	print(movementVector)
	velocity=movementVector.normalized() * Speed
	move_and_slide()
