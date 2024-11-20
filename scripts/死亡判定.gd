extends Area2D


@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _on_body_entered(body: Node2D) -> void:
	print("你死了, " + body.name)
	audio_stream_player.play()
	timer.start()
	pass


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
