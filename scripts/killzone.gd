extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Shark":
		get_tree().change_scene_to_file("res://scenes/dead_screen.tscn")
	else:
		body.queue_free()
