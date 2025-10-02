extends Node3D
@export var levels : Array[Node3D]
@export var camera : Node3D
var current_level := 0
func _ready():
	camera.show()
func _level_change(level: int):
	get_tree().create_tween().tween_property(levels[current_level], "scale", Vector3(0.5,0.5,0.5), 1).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	get_tree().create_tween().tween_property(levels[current_level], "rotation:y", 360, 10).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	get_tree().create_tween().tween_property(levels[current_level], "position:y", 10, 2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	if not level > levels.size() -1:
		await get_tree().create_timer(0.25).timeout
		get_tree().create_tween().tween_property(levels[level], "scale", Vector3(1,1,1), 2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		get_tree().create_tween().tween_property(levels[level], "position:y", 0, 1).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		await get_tree().create_timer(1.75).timeout
		levels[current_level].queue_free()
	else:
		await get_tree().create_timer(1).timeout
		camera.hide()
		await get_tree().create_timer(2).timeout
		get_tree().quit()
	current_level = level
	
