extends KinematicBody2D

const SPEED = 30
const Gravity = 10
const Jump_Power = -250
const FLOOR = Vector2(0, -1)
const fireball = preload ("res://Screens/FireBall.tscn")

var on_ground = false
var velocity = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.flip_h = false
		velocity.x = SPEED
		$AnimatedSprite.play('run')
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = true		
		$AnimatedSprite.play('run')
		velocity.x = -SPEED
		
	else:
		velocity.x = 0
		$AnimatedSprite.play('idel')
	
	if Input.is_action_pressed("ui_up"):
		if on_ground == true:
			velocity.y = Jump_Power
			on_ground = false
	
	if Input.is_action_just_pressed("KEY_SPACE"):
		var fireball = fireball.instance()
		get_parent().add_child(fireball)
		fireball.postion = $Position2D.global_position
		
	velocity.y += Gravity
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
		
		
	velocity = move_and_slide(velocity, FLOOR)

