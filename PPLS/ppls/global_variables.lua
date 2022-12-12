WIDTH = 600fx
HEIGHT = 600fx
IWIDTH = 600
IHEIGHT = 600
SPAWN_X = WIDTH/2fx
SPAWN_Y = HEIGHT/2fx
CAM_DIST = -300fx
WHITE = 0xffffffff
RX,RY = 6fx,6fx
TIME = 0
ENT_PATH = "/dynamic/entities/"
RANGLE = fmath.random_fixedpoint(0fx, fmath.tau())
PX, PY = SPAWN_X,SPAWN_Y
--Frequency
FREQ30 = pewpew.CannonFrequency.FREQ_30
FREQ15 = pewpew.CannonFrequency.FREQ_15
FREQ10 = pewpew.CannonFrequency.FREQ_10
FREQ7_5 = pewpew.CannonFrequency.FREQ_7_5
FREQ6 = pewpew.CannonFrequency.FREQ_6
FREQ5 = pewpew.CannonFrequency.FREQ_5
FREQ3 = pewpew.CannonFrequency.FREQ_3
FREQ2 = pewpew.CannonFrequency.FREQ_2
FREQ1 = pewpew.CannonFrequency.FREQ_1
--Cannon
SINGLE = pewpew.CannonType.SINGLE
TIC_TOC = pewpew.CannonType.TIC_TOC
DOUBLE = pewpew.CannonType.DOUBLE
TRIPE = pewpew.CannonType.TRIPE
FOUR_DIRECTIONS = pewpew.CannonType.FOUR_DIRECTIONS
DOUBLE_SWIPE = pewpew.CannonType.DOUBLE_SWIPE
HEMISPHERE = pewpew.CannonType.HEMISPHERE
--Mothership
THREE_COR = pewpew.MothershipType.THREE_CORNERS
FOUR_COR = pewpew.MothershipType.FOUR_CORNERS
FIVE_COR = pewpew.MothershipType.FIVE_CORNERS
SIX_COR = pewpew.MothershipType.SIX_CORNERS
SEVEN_COR = pewpew.MothershipType.SEVEN_CORNERS
--WeaponType
ATOMIZE_EXP = pewpew.WeaponType.ATOMIZE_EXPLOSION
FREEZE_EXP = pewpew.WeaponType.FREEZE_EXPLOSION
REPULSIVE_EXP = pewpew.WeaponType.REPULSIVE_EXPLOSION
BULLET = pewpew.WeaponType.BULLET
--EntityType
ASTEROID = pewpew.EntityType.ASTEROID
BAF = pewpew.EntityType.BAF
BAF_BLUE = pewpew.EntityType.BAF_BLUE
BAF_RED = pewpew.EntityType.BAF_RED
BOMB = pewpew.EntityType.BOMB
CROWDER = pewpew.EntityType.CROWDER
CUS_ENTITY = pewpew.EntityType.CUSTOMIZABLE_ENTITY
INERTIAC = pewpew.EntityType.INERTIAC
MOTHERSHIP = pewpew.EntityType.MOTHERSHIP
MOTHERSHIP_BULLET = pewpew.EntityType.MOTHERSHIP_BULLET
ROLLING_CUBE = pewpew.EntityType.ROLLING_CUBE
ROLLING_SPHERE = pewpew.EntityType.ROLLING_SPHERE
SHIP = pewpew.EntityType.SHIP
UFO = pewpew.EntityType.UFO
UFO_BULLET = pewpew.EntityType.UFO_BULLET
WARY = pewpew.EntityType.WARY
WARY_BULLET = pewpew.EntityType.WARY_MISSILE
PLAYER_BULLET = pewpew.EntityType.PLAYER_BULLET
BOMB_EXPLOSION = pewpew.EntityType.BOMB_EXPLOSION
PLAYER_EXPLOSION = pewpew.EntityType.PLAYER_EXPLOSION
--BombType
FREEZE = pewpew.BombType.FREEZE
REPULSIVE = pewpew.BombType.REPULSIVE
ATOMIZE = pewpew.BombType.ATOMIZE
SMALL_ATOMIZE = pewpew.BombType.SMALL_ATOMIZE