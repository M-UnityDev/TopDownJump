extends StaticBody3D
@export var hit_area: Area3D
@export var level: int
var material: Material
signal change(level: int)
signal on_change
func _ready() -> void:
	material = $MeshInstance3D.get_active_material(0)
	hit_area.body_entered.connect(change_level)
func change_level(_body):
	hit_area.queue_free()
	emit_signal("on_change")
	get_tree().create_tween().tween_property(material, "albedo_color:a", 0, 0.25).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT).set_delay(0.1)
	await get_tree().create_tween().tween_property(self, "scale", Vector3(0.5,0.5,0.5), 0.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT).finished
	emit_signal("change",level)
	material.albedo_color = Color(0,1,0)
	self.queue_free()
