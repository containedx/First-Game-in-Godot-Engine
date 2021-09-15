tool
extends Button

export(String, FILE) var next_scene: = ""

func _on_PlayButton_button_up():
	get_tree().change_scene(next_scene)


# warning if no next scene assigned
func _get_configuration_warning():
	return "next-scene path must be set for the button to work" if next_scene == "" else ""
