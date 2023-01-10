extends Node

var canSpawn = true
var total_score = 0
var score = 0
var strikes = 0
var necessary_score = 0
var target_percentage = 0
var current_percentage = 0
var total_grammies = 0
var current_level = null
var win = false
var currentlyMulchingGrammy = false

var menu = "res://Main Menu.tscn"
var endscreen = "res://endscreen.tscn"
var finalscreen = "res://FinalPaycheck.tscn"

#tutorial, easy, medium, hard, bonus, final screen
var level = ["res://Tutorial.tscn", "res://EasyLevel.tscn", "res://MediumLevel.tscn", "res://HardLevel.tscn", "res://BonusLevel.tscn", finalscreen]
var next_level = 0

var granny_totals = [1, 3, 6, 9, 12, 0 ]
var win_percentages = [1, .3, .5, .75, 0, 0]


func _process(delta):
	handle_score()
	if total_grammies != -1:
		end_logic()

func handle_score():
	if total_grammies > 0:
		current_percentage = float(score)/float(total_grammies)

func end_logic():
	var testcase = score + strikes
	if testcase == total_grammies and total_grammies > 0:
		if score >= necessary_score and !win:
			win = true
			total_score += score
			next_level += 1
		if not currentlyMulchingGrammy:
			total_grammies = -1
			yield(get_tree().create_timer(1.5), "timeout")
			MusicController.non_level_music()
			get_tree().change_scene(endscreen)

func nextLevel():
	get_tree().change_scene(GrammyHandler.level[GrammyHandler.next_level])

func reset():
	canSpawn = true
	win = false
	score = 0
	strikes = 0
	total_grammies = granny_totals[next_level]
	target_percentage = win_percentages[next_level]
	necessary_score = int(ceil(target_percentage * total_grammies))
	current_level = level[next_level]

func full_reset():
	reset()
	next_level = 0
	total_score = 0
