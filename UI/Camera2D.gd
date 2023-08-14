extends Camera2D

onready var topLeft = $Limits/TopLeft
onready var bottomRight = $Limits/BottomRight

var shaking = false
var shake_duration = 3.84
var shake_amplitude = 1.7
var shake_timer = 0.0
var initial_position = Vector2(0, 0)

func _ready():
	limit_top = topLeft.position.y
	limit_left = topLeft.position.x
	limit_bottom = bottomRight.position.y
	limit_right = bottomRight.position.x
	initial_position = position

func shake():
	shaking = true
	shake_timer = 0.0

func _process(delta):
	if shaking:
		shake_timer += delta
		if shake_timer < shake_duration:
			var offset = Vector2(randf() * 2 - 1, 0) * shake_amplitude
			position = initial_position + offset
		else:
			shaking = false
			position = initial_position
			

