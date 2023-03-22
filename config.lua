
-- Every trees are synced

Config = {}

Config.Admin = "admin" -- Admin group

Config.Commandspawn = "spawnfallentrees" -- Spawn all Fallen Trees

Config.Commanddel = "delfallentrees" -- Delete all Fallen Trees

Config.treeblip = true  -- true/false/"onlyjobs"

Config.treeblipjobs = { -- Blips show only jobs
	"police",
	"firefighter",
}

Config.axe1 = "WEAPON_BATTLEAXE"

Config.axe2 = "WEAPON_HATCHET"

Config.reward = "item" -- Get reward "money"/"item"/false (If "money you will get money, if "item" you will get random item from Config.Lootitem, if false you will get nothing,)

Config.reward_min = 500 -- Reward random minimum money ( If Config.reward = "money")

Config.reward_max = 1000 -- Reward random maximum money

Config.Lootitem = {   --Random get loot from these items. (If Config.reward = "item")
			{
				item = "bandage",
				minamount = 1,
				maxamount = 5,
			},
}

Config.spawntime_min = 20 -- Random spawn time minimum in minutes (New Trees spawn time or chopped Tree respawn minimum time in minute)

Config.spawntime_max = 90 -- Random spawn time maximum in minutes (New Trees spawn time or chopped Tree respawn maximum time in minute)

Config.treespawn_min = 4 --Random spawn amount minimum 

Config.treespawn_max = 8 --Random spawn amount maximum

Config.Locales = {
treetext = "Press ~g~E~s~ to start chopping",
noaxe = "You don't have Axe in your hand!",
fallentreeblip = "Fallen Tree",
}

Config.Trees = {  -- Trees coordinates
{coords = vector3(-563.88,5733.92,36.76), heading = 342.12},
{coords = vector3(-523.56,5823.64,34.72), heading = 332.28},
{coords = vector3(-175.68,6219.24,31.28), heading = 315.44},
{coords = vector3(286.72,6555.72,30.04), heading = 92.16},
{coords = vector3(815.4,6512.44,23.24), heading = 267.68},
{coords = vector3(1407.84,6460.0,20.28), heading = 72.36},
{coords = vector3(2126.32,6097.04,51.48), heading = 241.32},
{coords = vector3(2586.08,5351.48,44.52), heading = 195.24},
{coords = vector3(2642.56,4942.4,44.56), heading = 11.08},
{coords = vector3(2817.24,3524.0,54.36), heading = 346.72},
{coords = vector3(2740.12,3230.6,54.84), heading = 154.88},
{coords = vector3(2569.08,3081.88,45.48), heading = 313.8},
{coords = vector3(1977.04,2487.04,54.52), heading = 153.2},
{coords = vector3(1728.24,1762.48,78.32), heading = 356.68},
{coords = vector3(1373.24,690.16,79.36), heading = 317.68},
{coords = vector3(1390.32,652.88,79.72), heading = 130.96},
{coords = vector3(930.4,316.04,88.4), heading = 136.68},
{coords = vector3(450.32,299.92,103.24), heading = 251.92},
{coords = vector3(107.2,401.44,116.2), heading = 310.32},
{coords = vector3(-271.04,422.68,108.88), heading = 73.68},
{coords = vector3(-883.84,440.68,86.88), heading = 273.52},
{coords = vector3(-1292.56,218.2,59.48), heading = 271.92},
{coords = vector3(-1264.32,-73.76,45.24), heading = 241.0},
{coords = vector3(-495.12,-104.92,38.96), heading = 21.76},
{coords = vector3(183.2,-203.68,54.36), heading = 63.12},
{coords = vector3(1053.28,-332.56,67.2), heading = 238.2},
{coords = vector3(143.92,-895.92,30.56), heading = 333.96},
{coords = vector3(135.2,-919.96,30.28), heading = 157.4},
{coords = vector3(216.72,-982.28,29.8), heading = 241.04},
{coords = vector3(220.76,-1267.92,29.52), heading = 357.04},
{coords = vector3(294.96,-1322.28,31.2), heading = 86.56},
{coords = vector3(415.32,-1795.12,28.76), heading = 48.68},
{coords = vector3(324.12,-1922.48,25.16), heading = 51.36},
{coords = vector3(-60.88,-1556.92,31.04), heading = 225.36},
{coords = vector3(-509.92,-1337.04,29.44), heading = 162.28},
{coords = vector3(-601.24,-658.44,32.28), heading = 88.64},
{coords = vector3(-1263.12,-548.32,30.6), heading = 38.36},
{coords = vector3(-1356.2,-456.12,34.12), heading = 31.36},
{coords = vector3(-1111.64,-1315.6,5.52), heading = 294.84},
{coords = vector3(-1047.84,-1510.72,5.24), heading = 212.0},
{coords = vector3(-836.32,-2265.72,8.0), heading = 229.16},
{coords = vector3(-985.44,-2683.16,14.04), heading = 154.56},
{coords = vector3(662.28,-2717.88,6.2), heading = 197.8},
{coords = vector3(140.32,-2561.92,6.08), heading = 88.36},
{coords = vector3(933.76,-2146.16,30.56), heading = 177.68},
{coords = vector3(797.44,-2440.6,21.76), heading = 264.32},
{coords = vector3(1439.16,-1901.88,71.48), heading = 166.12},
{coords = vector3(1393.8,-1777.04,65.56), heading = 111.48},
{coords = vector3(-67.4,1064.16,223.32), heading = 273.44},
{coords = vector3(613.92,1777.56,198.92), heading = 59.76},
{coords = vector3(1229.0,1015.68,144.04), heading = 14.48},
{coords = vector3(-148.96,1501.36,288.88), heading = 95.24},
{coords = vector3(-774.16,1633.32,205.68), heading = 33.24},
{coords = vector3(-1646.72,1034.92,153.28), heading = 343.8},
{coords = vector3(-903.76,1732.28,181.64), heading = 336.12},
{coords = vector3(-1365.32,2277.4,43.72), heading = 355.56},
{coords = vector3(1013.32,2702.12,39.64), heading = 271.24},
{coords = vector3(1456.8,1821.0,107.28), heading = 96.28},
{coords = vector3(1908.68,3187.88,46.04), heading = 228.4},
{coords = vector3(2023.8,3689.72,33.04), heading = 116.36},
{coords = vector3(238.68,3308.92,40.24), heading = 161.6},
{coords = vector3(-3121.64,1190.68,20.36), heading = 355.52},
{coords = vector3(-2346.92,-271.96,13.92), heading = 237.96},
{coords = vector3(-653.12,4019.4,127.68), heading = 262.56},
{coords = vector3(1985.56,4604.4,40.76), heading = 119.4},
{coords = vector3(3483.96,4702.12,51.8), heading = 205.44},
{coords = vector3(3342.08,3677.68,42.24), heading = 315.04},
{coords = vector3(-1451.24,5072.48,61.56), heading = 311.8},
{coords = vector3(-1469.4,5018.56,62.52), heading = 136.2},
{coords = vector3(-2466.56,2283.88,31.4), heading = 110.2},
{coords = vector3(2515.92,231.28,105.84), heading = 352.12},
{coords = vector3(2575.24,779.0,90.16), heading = 208.08},
{coords = vector3(2530.08,1910.0,20.48), heading = 355.36},
{coords = vector3(846.6,4372.24,52.28), heading = 201.64},
{coords = vector3(570.8,1383.24,304.68), heading = 156.04},
}

