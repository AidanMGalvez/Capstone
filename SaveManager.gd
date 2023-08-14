extends Node
# Main scene

# Underground scene
var Spider=0
func add_spider():
	Spider += 1
	
var rock = 0
func add_rock():
	rock += 1

#Player and Health scene
var spiderkey=0
func add_spiderkey():
	spiderkey += 1
var spider_animation = 0
func animationplayed():
	spider_animation += 1

var cloudkey=0
func add_cloudkey():
	cloudkey += 1
	
var earthkey=0
func add_earthkey():
	earthkey += 1

var hp = 100
func save_health():
	print(hp)

var playerdirection = 0

