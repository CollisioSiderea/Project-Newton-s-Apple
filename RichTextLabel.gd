extends RichTextLabel

var dialog=["THIS IS A TEST TEXT FOR NEWTON'S APPLE", "PLEASE WORK"]
var page=0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)

func _input(event):
	if InputEvent: #.is_action_just_pressed("ui_accept"):
		#print("DEBERIA FUNCAR POR INPUT")
		if get_visible_characters()>get_total_character_count():
			if page<dialog.size()-1:
				page+=1
				set_bbcode(dialog[page])
				set_visible_characters(0)
				print("NO DEBERIA FUNCAR")
		else:
			set_visible_characters(get_visible_characters()+1)
			print("DEBERIA FUNCAR")
				
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
