extends LineEdit

func _ready():
	self.grab_focus()
	var _result = self.connect("text_changed", self, "text_changed")
	var _result2 = self.connect("text_entered", self, "enter_pressed")


func text_changed(new_text):
	if new_text.is_valid_integer():
		$"../Submit".disabled = false
		HIGHSCORE_SINGLETON.SCORE = int(new_text)
	else:
		$"../Submit".disabled = true
		HIGHSCORE_SINGLETON.SCORE = null


func enter_pressed(_new_text):
	if not $"../Submit".disabled:
		$"../Submit"._pressed()
