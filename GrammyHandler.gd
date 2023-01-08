extends Node

var canSpawn = true
var score = 0
var strikes = 0
var necessary_score = 0
var target_percentage = 0
var current_percentage = 0
var total_grammies = 0
var current_level = null
var win = false


func _process(delta):
	handle_score()
	end_logic()

func handle_score():
	if total_grammies > 0:
		current_percentage = score/total_grammies

func end_logic():
	if score + strikes == total_grammies:
		if score >= necessary_score: win = true
		#Go to between-level end screen

func reset(grammy_total, target_percent, curr_level):
	canSpawn = true
	win = false
	score = 0
	strikes = 0
	total_grammies = grammy_total
	target_percentage = target_percent
	necessary_score = int(target_percentage * total_grammies)
	current_level = curr_level
	
