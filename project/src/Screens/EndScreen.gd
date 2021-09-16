extends Control

onready var label: Label = get_node("Label Score/Score")
onready var audio_player: AudioStreamPlayer = $Audio
onready var video_player: VideoPlayer = $VideoPlayer

func _ready():
	$Timer.connect("timeout", self, "turn_off_video")
	
	
func _unhandled_input(event):
	if event.is_action_pressed("skip"):
		turn_off_video()
		$Timer.stop()

func turn_off_video():
	video_player.visible = false
	video_player.queue_free()
	audio_player.play()
	label.text = "%s" % PlayerData.score
