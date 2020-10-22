extends KinematicBody2D

const SPEED = 110
const GRAVITY = 20
const JUMP_POWER = -350
const FLOOR = Vector2.UP

var velocity = Vector2(0,0)

func _physics_process(delta):
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$AnimatedSprite.play('run')
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$AnimatedSprite.play('run')
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play('idel')
	
	if not is_on_floor():
		$AnimatedSprite.play('jump')
	
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_POWER
	
	velocity = move_and_slide(velocity, FLOOR)
	velocity.x = lerp(velocity.x, 0, 0.2)
	
