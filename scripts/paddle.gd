extends CharacterBody2D

var input : float

const SPEED = 720

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	input = Input.get_axis("left","right")
	
func _physics_process(delta):
	velocity.x = input
	move_and_collide(velocity * SPEED * delta)
