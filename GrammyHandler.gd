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

var menu = "res://Main Menu.tscn"
var endscreen = "res://endscreen.tscn"

#tutorial, easy, medium, hard, bonus, main menu (or final end screen)
var level = ["res://Tutorial.tscn", menu]
var next_level = 0

var granny_totals = [1, 3, 6, 9, 12, 0 ]
var win_percentages = [1, .3, .5, .75, 0, 0]


func _process(delta):
	handle_score()
	end_logic()

func handle_score():
	if total_grammies > 0:
		current_percentage = score/total_grammies

func end_logic():
	var testcase = score + strikes
	if testcase == total_grammies and total_grammies > 0:
		if score >= necessary_score:
			win = true
			next_level += 1
		get_tree().change_scene(endscreen)

func reset():
	canSpawn = true
	win = false
	total_score += score
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
