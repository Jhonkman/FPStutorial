extends KinematicBody

var target

func _process(delta):
	if target:
		look_at(target.global_transform.origin, Vector3.UP)

func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		target = body
		print(body.name + " entered")
		set_color_red()

func _on_Area_body_exited(body):
	if body.is_in_group("Player"):
		target = null
		print(body.name + " exited")
		set_color_green()
	
func set_color_red():
	$MeshInstance.get_surface_material(0).set_albedo(Color(1,0,0))
	
func set_color_green():
	$MeshInstance.get_surface_material(0).set_albedo(Color(0,1,0))
