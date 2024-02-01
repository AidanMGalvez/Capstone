extends Node
# Main scene
var rand = RandomNumberGenerator.new()
var playerposition
# Underground scene
var Spider=0
func add_spider():
	Spider += 1
	
var rock = 0
func add_rock():
	rock += 1

#Player and Health scene
var collectspider = false
var spiderkey=0
func add_spiderkey():
	spiderkey += 1
	
var spider_animation = 0
func animationplayed():
	spider_animation += 1

var collectcloud = false
var cloudkey=0
func add_cloudkey():
	cloudkey += 1

var cloud_animation = 0
func cloudanimation():
	cloud_animation += 1

var collectearth = false
var earthkey=0
func add_earthkey():
	earthkey += 1

var earth_animation = 0
func earthanimation():
	earth_animation +=1

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
var gateopen = false
#shop and inventory
var coins = 0
var daggercount = 10
var spiderlegcount = 0
var wood = 0
var cloud = 0
var volcanicrock= 0
var amethyst = 0
var smallhealth = 0
var largehealth = 0
var spiderhealth = 40
var usesmall = false
var uselarge = false

var cloak
var boots
var dagger
var shield
var sword

var buyCloak = false
var buyBoots = false
var buyDagger = false
var buyShield = false
var buySword = false

# position on scene change
var LeaveShop = false
var LeaveMagic = false
var LeaveSky = false
var initialized = false
var leaveunderground = false
var failedjump = false
var LeaveParkour = false
var useslingshot = false
var falling = false
var leavefrog = false
var leavewell = false
var leavespiderboss = false
var leavecraft = false
var leavefrogboss = false

# bosses
var skyboss = 200
var skydefeat = false
var finalboss = false
var robotdefeat = false
var rejoinfinal = false
var frogdefeat = false
