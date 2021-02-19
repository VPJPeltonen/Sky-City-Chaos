extends Area

signal loop_done

func _on_Porter_body_entered(body):
	if body.is_in_group("player"):
		print("porting")
		body.global_transform.origin = $Position3D.global_transform.origin
		emit_signal("loop_done")
		#body.global_transform.origin = Vector3($Position3D.global_transform.origin.x,
		#												body.global_transform.origin.y,
		#												body.global_transform.origin.z)
