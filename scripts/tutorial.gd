extends Node2D

func _init() -> void:
	randomize()

func _ready() -> void:
	Global.power = 0

func _physics_process(_delta: float) -> void:
	pass

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Shark":
		get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
	else:
		body.queue_free()
