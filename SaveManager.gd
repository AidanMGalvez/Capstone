extends Node
# Main scene
var rand = RandomNumberGenerator.new()

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

func spider_died():
	var randomcoinamount = rand.randi_range(2,7)
	coins += randomcoinamount
	spiderlegcount += 1

var playerdirection = 0
var movement = 0
var blockjump = false
#shop and inventory
var coins = 0
var daggercount = 10
var spiderlegcount = 0
var wood = 0
var cloud = 0
var volcanicrock= 0
var amethyst = 0
var spiderhealth = 40
# position on scene change
var LeaveShop = false
var LeaveMagic = false
var LeaveSky = false
var initialized = false
var failedjump = false
var LeaveParkour = false
var useslingshot = false
var falling = false
var leavefrog = false
