extends CharacterBody2D

signal score(points)
signal game_over()

enum Layer {
	BOUNCE = 1,
	PADDLE = 2,
	BRICK = 4,
	DEATH = 5
}

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2(-480,-480)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		var body := collision.get_collider()
		if body.get_collision_layer_value(Layer.DEATH):
			emit_signal("game_over")
		else:
			velocity = velocity.bounce(collision.get_normal())
			if body.get_collision_layer_value(Layer.BRICK):
				body.queue_free()
				emit_signal("score", 1)
		
