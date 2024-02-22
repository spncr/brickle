extends StaticBody2D

var color : Color
# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.set_color(color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
