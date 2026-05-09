extends AudioStreamPlayer

const menu_music = preload("res://Assets/Audios/Hero Immortal.mp3")
const game_music = preload("res://Assets/Audios/8-bit_perilous_dungeon.mp3")

func play_music(music: AudioStream, volume = -20.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()

func play_music_menu():
	play_music(menu_music, -15.0)

func play_music_game():
	play_music(game_music, -30.0)

func stop_music():
	$".".stop()
