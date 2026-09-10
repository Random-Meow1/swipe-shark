extends Control

@onready var music_setting: CheckButton = $VBoxContainer/MusicSetting
@onready var sixseven_setting: CheckButton = $"VBoxContainer/67Setting"
@onready var fullscreen_setting: CheckButton = $VBoxContainer/FullscreenSetting
@onready var quit_button: Button = $Quit
@onready var message: Label = $Message

func adjust_ui_scale():
	var window = get_window()
	var screen_width = DisplayServer.screen_get_size().x
	var screen_height = DisplayServer.screen_get_size().y
	
	if screen_width < 2000 or screen_height < 2000:
		window.content_scale_factor = 0.75
	else:
		window.content_scale_factor = 1.0

func _ready() -> void:
	music_setting.button_pressed = Global.is_music_playing
	sixseven_setting.button_pressed = Global.is_sixseven_meme_active
	if Global.is_sixseven_setting_hidden:
		sixseven_setting.hide()
	if OS.has_feature("pc") or OS.has_feature("macos") or OS.has_feature("linux"):
		fullscreen_setting.show()
		quit_button.show()
	else:
		fullscreen_setting.hide()
		quit_button.hide()
	
	adjust_ui_scale()
	
	# set the splash message
	message.text = [
		"The temperature is probably less than 5000 degrees",
		"Remember to take a break!",
		"Lincoln had the idea!",
		"Share with a friend!",
		"Don't set your password to password",
		"Works on iPhones!",
		"Is your refrigerator running? Well you better go CATCH IT!",
		"No cheating allowed!",
		"Made in the US.",
		"100% free!",
		"This is not an ad.",
		"A tip should probably be here...",
		"pneumonoultramicroscopicsilicovolcanoconiosis",
		"Don't let the oil scare you!",
		"Can you say \"random rain\" quickly five times?",
		"You have probably played this game for more than 1 second.",
		"Random Meowwwwwwwww",
		"LOL!",
		"Are you streaming right now?",
		"All ages can play!",
		"Try jumping!",
		"Spam clicker!",
		"Interesting choice.",
		"What did you just say?",
		"Hello!",
		"There's a hidden Rickroll!",
		"This could be a meme...",
		"Calling all YouTubers!",
		"This is not AI",
		"It's most likely the 21st century",
		"I think bananas are yellow",
		"Stop getting chocolate on your screen!",
		"[funny cat meme here]",
		"No ads!",
		"I am trying my best not to copy Minecraft.",
		"Press Play!",
		"This game is called Swipe Shark",
		"Keep it clean!",
		"Try saying: Hey Siri, I am your father",
		"Siri can tell jokes!",
		"Don't click suspicious links!",
		"This message is completely random!",
		"We're no strangers to love...",
		"Spin a wheel!",
		"I told you.",
		"See?",
		"Don't play while driving.",
		"How dare you!",
		"Am I in a game?",
		"Your device can run this game (as you can see)",
		"I must not tell lies",
		"No, that's impossible!",
		"Wonderful!"
	].pick_random()

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_how_to_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_music_setting_toggled(toggled_on: bool) -> void:
	if toggled_on:
		Global.play_music()
	else:
		Global.pause_music()

func _on_sixseven_setting_toggled(toggled_on: bool) -> void:
	Global.is_sixseven_meme_active = toggled_on
	if !toggled_on:
		sixseven_setting.hide()
		Global.is_sixseven_setting_hidden = true

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_fullscreen_setting_toggled(toggled_on: bool) -> void:
	if OS.has_feature("pc") or OS.has_feature("macos") or OS.has_feature("linux"):
		if toggled_on:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
