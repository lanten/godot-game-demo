extends Area2D


@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_body_entered(body: Node2D) -> void:
	print("你死了, " + body.name)
	StateManager.pleayer_survive = false
	audio_stream_player.play()
	Engine.time_scale = 0.1
	timer.start()
	pass


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	StateManager.pleayer_survive = true
	Engine.time_scale = 1
