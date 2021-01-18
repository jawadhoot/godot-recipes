extends KinematicBody2D

export var speed = 64
var moving_via_mouse = true
var target = Vector2()
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		target = get_global_mouse_position()
		moving_via_mouse = true
	
func _physics_process(delta):
	get_input()
	if moving_via_mouse:
		velocity = (target - position).normalized() * speed
		
		
	if position.distance_to(target) < 5 and moving_via_mouse:
		moving_via_mouse = false
		velocity = Vector2.ZERO
	
	if velocity == Vector2.ZERO:

		velocity = Vector2.ZERO
		
	velocity = velocity.normalized() * speed
	velocity = velocity.floor()
	velocity = move_and_slide_with_snap(velocity)
	velocity = Vector2.ZERO
