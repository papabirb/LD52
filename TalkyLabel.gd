extends Label

var textToAdd = ""
# Tutorial, easy, medium, hard, bonus, paycheck
var levelSpecificText = [
	"Congratulations on landing your new job here at GramCo™!\nTo prepare you for your exciting new career as a GRAMMY BOUNCER®,\nwe've prepared some on-the-job training for you.\nPlease proceed to the Grammy Pupa Harvesting room and\nBounce® 1 Grammy into the Grammy Wiggler® to make your first bag of Grammy Sugar®.\nBe quick now, get in there before the Pupa pops!",
	"Great work yesterday!\nNow you're ready for the real deal.\nDon't stress too much, it's our off-season so there's only\na few Grammies that need Bouncing® today.",
	"You're really getting the hang of yourself out there.\nSpeaking of hanging, there's a few more Grammies out there today,\nnow that the weather's getting warmer!\nGet out there and Bounce® us proud!",
	"Demand for Grammy Sugar® has been going through the roof!\nI'm glad to see you arrived to work early today,\nwe need your Bounce® expertise now more than ever!\nGet out there and gimme some Sugar®!",
	"Heyyy, so, Bob from the office down the hall had a great idea recently,\nand I'm afraid the job of Grammy Bouncer® is going to be irelevant after today.\nSee, he said if we just plant the Pupas over the Wiggler® to begin with...\nAnyway, I know you don't have the head for all that bigger picture stuff,\nso just get on out there and do your best.\nYou'll be paid double for your final harvest, and there's\nno required yield since we've got plenty of Grammy Sugar® reserves.\nGood luck and have fun!",
	"Great work out there! Now if you'll just follow me to my office,\nwe'll get the paperwork all settled and get you your first and final paycheck.\nIt's been a pleasure working with you!"
]

func _ready():
	randomize()
	textToAdd = levelSpecificText[GrammyHandler.next_level]

func _on_Timer_timeout():
	if textToAdd.length() > 0:
		var add = textToAdd[0]
		text += add
		textToAdd = textToAdd.substr(1)
		if add != " " and add != "\n":
			var music_array = [1, 1.5, 2]
			$AudioStreamPlayer.pitch_scale = music_array[randi() % music_array.size()]
			$AudioStreamPlayer.play()
		$Timer.start()
