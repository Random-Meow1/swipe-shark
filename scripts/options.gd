extends Control

@onready var setting_1: CheckButton = $VBoxContainer/Setting1
@onready var setting_2: CheckButton = $VBoxContainer/Setting2
@onready var setting_3: CheckButton = $VBoxContainer/Setting3
@onready var setting_4: CheckButton = $VBoxContainer/Setting4
@onready var setting_5: CheckButton = $VBoxContainer/Setting5
@onready var setting_6: CheckButton = $VBoxContainer/Setting6
@onready var setting_7: CheckButton = $VBoxContainer/Setting7
@onready var setting_8: CheckButton = $VBoxContainer/Setting8

func _ready() -> void:
	setting_1.button_pressed = Global.settings["can_stop"]
	setting_2.button_pressed = Global.settings["auto_jump"]
	setting_4.button_pressed = Global.settings["powerups"]
	setting_5.button_pressed = Global.settings["fixed_platform_gap"]
	setting_6.button_pressed = Global.settings["adaptive_oil_speed"]
	setting_7.button_pressed = Global.settings["two_platforms_in_one"]
	setting_8.button_pressed = Global.settings["travel_through_platforms"]

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_setting_1_toggled(toggled_on: bool) -> void:
	Global.settings["can_stop"] = setting_1.button_pressed


func _on_setting_2_toggled(toggled_on: bool) -> void:
	Global.settings["auto_jump"] = setting_2.button_pressed


func _on_setting_4_toggled(toggled_on: bool) -> void:
	Global.settings["powerups"] = setting_4.button_pressed


func _on_setting_5_toggled(toggled_on: bool) -> void:
	Global.settings["fixed_platform_gap"] = setting_5.button_pressed


func _on_setting_6_toggled(toggled_on: bool) -> void:
	Global.settings["adaptive_oil_speed"] = setting_6.button_pressed


func _on_setting_7_toggled(toggled_on: bool) -> void:
	Global.settings["two_platforms_in_one"] = setting_7.button_pressed


func _on_setting_8_toggled(toggled_on: bool) -> void:
	Global.settings["travel_through_platforms"] = setting_8.button_pressed


func _on_reset_pressed() -> void:
	setting_1.button_pressed = true
	setting_2.button_pressed = true
	setting_4.button_pressed = true
	setting_5.button_pressed = false
	setting_6.button_pressed = true
	setting_7.button_pressed = false
	setting_8.button_pressed = false
