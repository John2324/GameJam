extends KinematicBody2D

const SPEED = 100
const Gravity = 10
const Jump_Power = -250
const FLOOR = Vector2(0, -1)

var on_ground = false
var velocity = Vector2(0,0)

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		$AnimatedSprite.flip_h = false
		velocity.x = SPEED
		$AnimatedSprite.play('run')
	elif Input.is_action_pressed("left"):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('run')
		velocity.x = -SPEED
	else:
		velocity.x = lerp(velocity.x, 0, 0.3)
		$AnimatedSprite.play('idel')
	
	if Input.is_action_pressed("up"):
		if on_ground == true:
			velocity.y = Jump_Power
			on_ground = false
	
		
	velocity.y += Gravity
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
		
		
	velocity = move_and_slide(velocity, FLOOR)

