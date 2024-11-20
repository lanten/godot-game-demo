extends CharacterBody2D

# 移动速度
const SPEED = 130.0
# 跳跃高度
const JUMP_VELOCITY = -300.0
# 二段跳次数限制
const DOUBLE_JUMP_LIMIT = 2

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var global_status: Node = %GlobalStatus

var double_jump_level = 0

func _physics_process(delta: float) -> void:
	# 获取角色运动方向 -1，0，1
	var direction := Input.get_axis("move_left", "move_right")
	
	if not StateManager.pleayer_survive:
		print("你已经死了，不能再动了！")
		move_and_slide()
		return 
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Add the gravity.
	if is_on_floor():
		double_jump_level = 0 # 重置二段跳
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		velocity += get_gravity() * delta
		if double_jump_level > 1:
			animated_sprite.play("roll")
		else	:
			animated_sprite.play("jump")
		


	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and double_jump_level < DOUBLE_JUMP_LIMIT:
		velocity.y = JUMP_VELOCITY
		double_jump_level += 1

	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
