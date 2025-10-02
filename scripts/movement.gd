extends CharacterBody3D
@export var speed := 200
@export var gravity := -10
@export var jump_speed := 6
var direction: Vector3
var current_speed := speed
func _physics_process(_delta):
	direction.x = Input.get_axis("ui_left","ui_right") * speed * _delta
	direction.z = Input.get_axis("ui_up","ui_down") * speed * _delta
	if not is_on_floor():
		direction.y += gravity * _delta
	elif Input.is_action_just_pressed("jump"):
		direction.y = jump_speed
	velocity = lerp(velocity, direction, 10 * _delta)
	move_and_slide()
func _on_change():
	speed = 0
	await get_tree().create_timer(2).timeout
	speed = current_speed
