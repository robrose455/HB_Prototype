extends KinematicBody

var velocity = Vector3()
var mass = 2
var weight = 9.8 * mass
var hasJumped = false

func _ready():

	pass

func _process(delta):
	
	if Input.is_action_just_pressed("A"):
		
		velocity.z = -10
		
	if Input.is_action_just_pressed("S"):
		
		velocity.x = -10
		
	if Input.is_action_just_pressed("W"):
		
		velocity.x = 10
		
	if Input.is_action_just_pressed("D"):
		
		velocity.z = 10
		
		
	if Input.is_action_just_released("A"):
		
		velocity.z = 0
		
	if Input.is_action_just_released("S"):
		
		velocity.x = 0
		
	if Input.is_action_just_released("W"):
		
		velocity.x = 0
		
	if Input.is_action_just_released("D"):
		
		velocity.z = 0
		
	if Input.is_action_just_pressed("Space") and hasJumped == false:
		
		velocity.y = 20
		hasJumped = true
		
	var coll_info = move_and_collide(velocity * delta)
	
	if coll_info:
		
		hasJumped = false
		velocity.y = 0
		
	if not coll_info: 
		
		if velocity.y >= -weight:
			
			print(velocity.y)
			velocity.y += -0.4
		
	pass
