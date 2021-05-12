extends KinematicBody

var velocity = Vector3()
var mass = 2
var weight = 9.8 * mass
var hasJumped = false

func _ready():

	pass

func _process(delta):
	
	if Input.is_action_just_pressed("A"):
		velocity = transform.basis.z * -10
		
	if Input.is_action_just_pressed("S"):
		velocity = transform.basis.x * -10
		
	if Input.is_action_just_pressed("W"):
		velocity = transform.basis.x * 10
		
	if Input.is_action_just_pressed("D"):
		velocity = transform.basis.z * 10
		
		
	if Input.is_action_just_released("A"):
		velocity = transform.basis.x * 0
		
	if Input.is_action_just_released("S"):
		velocity = transform.basis.z * 0
		
	if Input.is_action_just_released("W"):
		velocity = transform.basis.z * 0
		
	if Input.is_action_just_released("D"):
		velocity = transform.basis.x * 0
		
	if Input.is_action_just_pressed("Space") and hasJumped == false:
		velocity.y = 20
		hasJumped = true
		
	var coll_info = move_and_collide(velocity * delta)
	
	if coll_info:
		
		hasJumped = false
		velocity.y = 0
		
	if not coll_info: 
		
		if velocity.y >= -weight:
			velocity.y += -0.4
		
		
func _unhandled_input(event):
	
	if event is InputEventMouseMotion:
		rotate_x(-event.relative.x / 100)
