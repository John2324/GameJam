extends KinematicBody2D

const SPEED = 110
const GRAVITY = 20
const JUMP_POWER = -350
const FLOOR = Vector2.UP

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
		velocity.x = lerp(velocity.x, 0, 0.2)
		$AnimatedSprite.play('idel')
	
	
	velocity.y += GRAVITY
	
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_POWER
	
	
	velocity = move_and_slide(velocity, FLOOR)

