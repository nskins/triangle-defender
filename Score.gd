extends RichTextLabel

var score = 0

func update_score(value):
	score = value
	text = "%s" % score

func _on_mob_squashed():
	update_score(score + 1)
