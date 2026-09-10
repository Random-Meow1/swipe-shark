extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var score : float = 0
var power : float = 0

var settings = {
	"can_stop" : true,
	"auto_jump" : true,
	"special_effects" : false,
	"powerups" : true,
	"fixed_platform_gap" : false,
	"adaptive_oil_speed" : true,
	"two_platforms_in_one" : false,
	"travel_through_platforms" : false,
}

var is_music_playing = true
var is_sixseven_meme_active = false
var is_sixseven_setting_hidden = false

func _ready():
	print("Audio stream player: ", audio_stream_player)

func play_music():
	audio_stream_player.stream_paused = false
	is_music_playing = true

func pause_music():
	audio_stream_player.stream_paused = true
	is_music_playing = false

func _on_audio_stream_player_finished() -> void:
	audio_stream_player.play()
