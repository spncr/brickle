extends Node

@export var brick_scene: PackedScene

var brick_positions : Array
var score := 0
var game_over = false
# Called when the node enters the scene tree for the first time.
func _ready():
	var colors := [
		"red",
		"orange",
		"yellow",
		"green",
		"blue",
		"purple"
	]
	for column in 17:
		for row in 6:
			var position = Vector2((column * 70) + 40,(row * 20) + 115)
			brick_positions.append(position)
			create_brick(position, colors[row])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if game_over:
		$GameOverLabel.text = "game over \n score: " + str(score)
		$GameOverLabel.visible = true
		if Input.is_action_just_pressed("button"):
			game_over = false
			$ball.position = Vector2(600,600)
			$GameOverLabel.visible = false
			

func create_brick(position, color):
	var new_brick = brick_scene.instantiate()
	new_brick.position = position
	new_brick.color = color
	add_child(new_brick)
	
## Signals	
func _on_scored(points):
	score += points

func _on_game_over():
	game_over = true
