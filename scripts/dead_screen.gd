extends Control

@onready var score: Label = $Score
@onready var title: Label = $Title

func _ready() -> void:
	var rounded_score = str(round(Global.score * 1000) / 1000)
	if rounded_score.contains("67") and Global.is_sixseven_meme_active:
		title.text = [
		"SIX SEVEN!",
		"Look, it's 67...",
		"67 NO WAY!!!"
		].pick_random()
	else:
		title.text = [
			"You died.",
			"Game over",
			"Oil wins!",
			"Darned oil...",
			"AAAAAAAAHHH!",
			"That's game!",
			"...",
			"You drowned in oil!",
			"Thanks for playing!",
			"That was intense!",
			"Keep going!",
			"Don't give up!",
			"Cooool!",
			"Aw man!",
			"Try again?",
			"You're on a roll!",
			"Never gonna give you up! (hehe rickrolled)",
			"WOW",
			"WHYYYYYY??",
			"Come on, you've got this!",
			"NOOOOOOOOO!!!",
			"Respawn?",
			"Retry!",
			"Oof",
			"You tried to swim in oil",
			"Subscribe!",
			"Have you seen the new movie yet?",
			"What's up, mate",
			"Bruh",
			"Speedrun!",
			"Can't do that...",
			"Dang it!",
			"Huh?",
			"Didn't see that coming, did you?",
			"^@&E%$@)!$&$!EJRF#(#&R#GQ)",
			"Aw dang it!",
			"Gasp!",
			"Meow"
			].pick_random()
	score.text = rounded_score

func _on_replay_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
