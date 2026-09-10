extends Node2D

var is_paused : bool = false
@onready var pause_button = $CanvasLayer/PauseMenu/Pause
@onready var quit_button = $CanvasLayer/PauseMenu/Quit

@onready var score_label = $CanvasLayer/Score
var platformY : int = -100
var platform_count : int = 0
@onready var oil: Area2D = $Oil
var oilspeed : float = 0
var platform_per_line_count : int = -1

func _init() -> void:
	randomize()

func _ready() -> void:
	Global.score = 0
	Global.power = 0

func _physics_process(delta: float) -> void:
	if $Shark.position.y > platformY - 100:
		if Global.settings["two_platforms_in_one"]:
			platform_per_line_count = 2
		else:
			platform_per_line_count = 1
		for i in range(platform_per_line_count):
			var platform = preload("res://scenes/platform.tscn").instantiate()
			platform.position = Vector2(randi_range(-50, 50), platformY)
			add_child(platform)
		platform_count += 1
		if fmod(platform_count, 22) == 0 and Global.settings["powerups"]:
			var powerup = preload("res://scenes/powerup.tscn").instantiate()
			powerup.position = Vector2(randi_range(-50, 50), platformY)
			add_child(powerup)
		if Global.settings["fixed_platform_gap"]:
			platformY -= 60
		else:
			platformY -= randi_range(50, 70)
	
	oil.position.y -= oilspeed
	if Global.settings["adaptive_oil_speed"]:
		if $Shark.position.y < $Oil.position.y - 200:
			if oilspeed < 4:
				oilspeed += 0.06
		else:
			if oilspeed > 0.8:
				oilspeed -= 0.05
			else:
				oilspeed = 0.8
	else:
		oilspeed = 1.52
	
	Global.score += delta
	
	score_label.text = String.num(Global.score, 2)

func _on_pause_pressed() -> void:
	is_paused = !is_paused
	
	quit_button.visible = is_paused
	get_tree().paused = is_paused
	
	if is_paused:
		pause_button.text = "Play"
	else:
		pause_button.text = "Pause"


func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/dead_screen.tscn")
