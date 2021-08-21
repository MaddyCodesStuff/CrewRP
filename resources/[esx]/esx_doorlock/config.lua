Config = {}
Config.ShowUnlockedText = true

Config.DoorList = {

 ------------------------------------------
 --	  MISSION ROW POLICE DEPARTMENT     --
 ------------------------------------------
	-- MRPD Main Door
	{
		authorizedJobs = { 'police', 'fireman', 'offpolice' },
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -1547307588, objHeading = 90.0, objCoords = vector3(434.7444, -983.0781, 30.8153)},
			{objHash = -1547307588, objHeading = -90.0, objCoords = vector3(434.7444, -980.7556, 30.8153)}
		},
		fixText = true,
		
	},

	--Lobby left

	{
		objHash = -1406685646,
		objHeading = 0.0,
		objCoords = vector3(440.5201, -977.6011, 30.82319),
		authorizedJobs = { 'police', 'fireman', 'offpolice', 'ambulance' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Lobby right

	{
		objHash = -96679321,
		objHeading = 180.0,
		objCoords = vector3(440.5201, -986.2335, 30.82319),
		authorizedJobs = { 'police', 'fireman', 'offpolice', 'ambulance' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	-- MRPD Atlee Entrance
	{
		authorizedJobs = { 'police', 'fireman', 'offpolice', 'ambulance' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -1547307588, objHeading = 360.0, objCoords = vector3(455.8862, -972.2543, 30.81531)},
			{objHash = -1547307588, objHeading = 180.0, objCoords = vector3(458.2087, -972.2543, 30.81531)}
		},
		fixText = true,
		
	},

	-- MRPD Vespucci Entrance
	{
		authorizedJobs = { 'police', 'fireman', 'offpolice', 'ambulance' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -1547307588, objHeading = 180.0, objCoords = vector3(443.0618, -998.7462, 30.8153)},
			{objHash = -1547307588, objHeading = 0.0, objCoords = vector3(440.7392, -998.74620, 30.8153)}
		},
		fixText = true,
		
	},

	--Archives

	{
		objHash = -96679321,
		objHeading = 135.0,
		objCoords = vector3(452.2663, -995.5254, 30.82319),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Locker Room

	{
		objHash = 149284793,
		objHeading = 225.0,
		objCoords = vector3(458.0894, -995.5247, 30.82319),
		authorizedJobs = { 'police', 'fireman', 'offpolice' },
		locked = true,
		maxDistance = 1.5,
	},

	--Captains office

	{
		objHash = -96679321,
		objHeading = 270.0,
		objCoords = vector3(458.6543, -990.6498, 30.82319),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	-- Forensics Lab
	{
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -1406685646, objHeading = 270.0, objCoords = vector3(479.75340, -986.2151, 30.82319)},
			{objHash = -96679321, objHeading = 270.0, objCoords = vector3(479.7534, -988.6204, 30.82319)}
		},
		fixText = true,
		
	},

	-- Armoury Main

	{
		objHash = -692649124,
		objHeading = 90.0,
		objCoords = vector3(479.7507, -999.6290, 30.78917),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	-- Armoury Side

	{
		objHash = -692649124,
		objHeading = 181.154,
		objCoords = vector3(487.4378, -1000.1890, 30.78697),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		oldMethod = true,
	},

	-- Dispatch Center

	{
		objHash = -96679321,
		objHeading = 135.0,
		objCoords = vector3(448.9846, -995.5264, 35.10376),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	-- Roof Access

	{
		objHash = -692649124,
		objHeading = 90.0,
		objCoords = vector3(464.3086, -984.5284, 43.77124),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	-- Garage Hallway Right

	{
		objHash = 1830360419,
		objHeading = 270.0,
		objCoords = vector3(464.1591, -974.6656, 26.3707),
		authorizedJobs = { 'police', 'fireman', 'offpolice', 'ambulance' },
		locked = true,
		maxDistance = 1.5,
	},

	-- Garage Hallway Left

	{
		objHash = 1830360419,
		objHeading = 90.0,
		objCoords = vector3(464.1566, -997.5093, 26.3707),
		authorizedJobs = { 'police', 'fireman', 'offpolice', 'ambulance' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Garage Hallway Middle

	{
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -1406685646, objHeading = 270.0, objCoords = vector3(471.3753, -985.0319, 26.40548)},
			{objHash = -96679321, objHeading = 270.0, objCoords = vector3(471.3753, -987.4374, 26.40548)}
		},
		fixText = true,
		
	},

	--Back Hallway to Garage Hallway

	{
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -288803980, objHeading = 180.0, objCoords = vector3(469.9274, -1000.5440, 26.40548)},
			{objHash = -288803980, objHeading = 0.0, objCoords = vector3(467.5222, -1000.5440, 26.40548)}
		},
		fixText = true,
		
	},

	-- gabz_mrpd	GARAGE ROLLER DOOR 1
	{
		objHash = 2130672747,
		objHeading = 0.0,
		objCoords = vector3(431.4119, -1000.772, 26.69661),
		authorizedJobs = { 'police', 'fireman', 'offpolice', 'ambulance' },
		locked = true,
		maxDistance = 6.0,
		slides = true,
		garage = true
	},
	
	-- gabz_mrpd	GARAGE ROLLER DOOR 2
	{
		objHash = 2130672747,
		objHeading = 0.0,
		objCoords = vector3(452.3005, -1000.772, 26.69661),
		authorizedJobs = { 'police', 'fireman', 'offpolice', 'ambulance' },
		locked = true,
		maxDistance = 6.0,
		slides = true,
		garage = true
	},

	--Processing Outer Door

	{
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -692649124, objHeading = 180.0, objCoords = vector3(469.7743, -1014.4060, 26.48382)},
			{objHash = -692649124, objHeading = 0.0, objCoords = vector3(467.3686, -1014.4060, 26.48382)}
		},
		fixText = true,
		
	},

	--Processing Hallway

	{
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = 149284793, objHeading = 270.0, objCoords = vector3(471.3679, -1007.7930, 26.40548)},
			{objHash = 149284793, objHeading = 0.0, objCoords = vector3(471.3758, -1010.1980, 26.40548)}
		},
		fixText = true,
		
	},

	-- Processing

	{
		objHash = -288803980,
		objHeading = 180.0,
		objCoords = vector3(475.9539, -1006.9380, 26.40639),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	-- Processing Gate 1

	{
		objHash = -53345114,
		objHeading = 270.0,
		objCoords = vector3(476.61570, -1008.8750, 26.48005),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	-- Processing Gate 2

	{
		objHash = -53345114,
		objHeading = 180.0,
		objCoords = vector3(481.00840, -1004.1180, 26.48005),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	-- Cell 1

	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(477.9126, -1012.1890, 26.48005),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	-- Cell 2

	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(480.9128, -1012.1890, 26.48005),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	-- Cell 3

	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(483.9127, -1012.1890, 26.48005),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	-- Cell 4

	{
		objHash = -53345114,
		objHeading = 0.0,
		objCoords = vector3(486.9131, -1012.1890, 26.48005),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	-- Cell 5

	{
		objHash = -53345114,
		objHeading = 180.0,
		objCoords = vector3(484.1764, -1007.7340, 26.48005),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	-- Observation 1

	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6694, -983.9868, 26.40548),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	-- Interrogation 1

	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6701, -987.5792, 26.40548),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	-- Observation 2

	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6699, -992.28810, 26.40548),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	-- Interrogation 2

	{
		objHash = -1406685646,
		objHeading = 270.0,
		objCoords = vector3(482.6703, -995.7285, 26.40548),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	-- Evidence

	{
		objHash = -692649124,
		objHeading = 135.0,
		objCoords = vector3(475.8323, -990.4839, 26.40548),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	--Back Gate
	{
		objHash = -1603817716,
		objHeading = 90.0,
		objCoords = vector3(488.8948, -1017.2120, 27.14935),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 6.0,
		slides = true,
	},
	
 ------------------------------------------
 --				  BCSO			   	    --
 ------------------------------------------

	--FrontDoor
	{
		objHash = -1765048490,
		objHeading = 30.0,
		objCoords = vector3(1855.6685, 3683.9300, 34.59282),
		authorizedJobs = { 'police', 'fireman', 'offpolice' },
		locked = false,
		maxDistance = 1.5,
	},
 
 	--Office
	{
		objHash = 1557126584,
		objHeading = 300.403,
		objCoords = vector3(1845.2260, 3687.7590, 34.41944),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	--Lockers
	{
		objHash = -2023754432,
		objHeading = 120.0,
		objCoords = vector3(1856.6320, 3693.5580, 34.41656),
		authorizedJobs = { 'police', 'fireman', 'offpolice' },
		locked = true,
		maxDistance = 1.5,
	},

	--Interrogation
	{
		objHash = -2023754432,
		objHeading = 121.0,
		objCoords = vector3(1849.3790, 3692.3230, 30.39818),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	--Processing
	{
		objHash = 631614199,
		objHeading = 210.0,
		objCoords = vector3(1843.921, 3687.33, 30.39675),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Cell 1
	{
		objHash = 631614199,
		objHeading = 210.0,
		objCoords = vector3(1853.005, 3681.192, 30.39675),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Cell 2
	{
		objHash = 631614199,
		objHeading = 210.0,
		objCoords = vector3(1856.156, 3682.999, 30.39675),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Cell 3
	{
		objHash = 631614199,
		objHeading = 120.595,
		objCoords = vector3(1856.896, 3687.222, 30.39675),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Cell 4
	{
		objHash = 631614199,
		objHeading = 210.0,
		objCoords = vector3(1853.274, 3686.40, 30.39675),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Armoury
	{
		objHash = -2023754432,
		objHeading = 300.0,
		objCoords = vector3(1848.4320, 3682.3650, 34.41944),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Backdoor
	{
		objHash = -2023754432,
		objHeading = 210.0,
		objCoords = vector3(1855.2230, 3700.8480, 34.41656),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

 ------------------------------------------
 --				  SASP			   	    --
 ------------------------------------------

	--Interrogation Observation
	{
		objHash = -2023754432,
		objHeading = 135.0,
		objCoords = vector3(-449.79460, 6015.44800, 31.86633),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	--Offices
	{
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = 964838196, objHeading = 45.0, objCoords = vector3(-440.98070, 6012.77100, 31.86633)},
			{objHash = 964838196, objHeading = 225.0, objCoords = vector3(-442.825150, 6010.93100, 31.86633)}
		},
		fixText = true,		
	},

	--Hallway
	{
		authorizedJobs = { 'police', 'fireman', 'ambulance' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -681066206, objHeading = 135.0, objCoords = vector3(-449.55, 6008.558, 31.80887)},
			{objHash = 245182344, objHeading = 315.0, objCoords = vector3(-447.70920, 6006.717, 31.80887)}
		},
		fixText = true,		
	},

    --Interrogation Room
	{
		objHash = -519068795,
		objHeading = 10.0,
		objCoords = vector3(-454.53600, 6011.25800, 31.86982),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

    --Backdoor Right
	{
		objHash = 452874391,
		objHeading = 315.0,
		objCoords = vector3(-450.97870, 6006.07500, 31.99417),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

    --Backdoor Left
	{
		objHash = 452874391,
		objHeading = 135.0,
		objCoords = vector3(-447.22630, 6002.32900, 31.83943),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

    --Evidence/Armoury Room
	{
		objHash = -1011692606,
		objHeading = 315.0,
		objCoords = vector3(-437.61440, 5992.81900, 31.93606),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Cell 1
	{
		objHash = 631614199,
		objHeading = 315.0,
		objCoords = vector3(-428.82, 5996.74, 31.72),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	--Cell 2
	{
		objHash = 631614199,
		objHeading = 315.0,
		objCoords = vector3(-431.96, 5999.87, 31.72),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

 ---------------------------------------
 --			 BOLINGBROKE			 --
 ---------------------------------------

	--Main Gates
	{
		objHash = 741314661,
		objHeading = 90.0,
		objCoords = vector3(1844.99800, 2604.81100, 44.63626),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 12.0,
		slides = true,
		fixText = true,
	},

	{
		objHash = 741314661,
		objHeading = 90.0,
		objCoords = vector3(1818.54300, 2604.71100, 44.60955),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 12.0,
		slides = true,
		fixText = true,
	},

	--Fence Corridor
	{
		objHash = -1156020871,
		objHeading = 180.0,
		objCoords = vector3(1797.761, 2596.565, 46.38731),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	{
		objHash = -1156020871,
		objHeading = 180.0,
		objCoords = vector3(1798.09, 2591.687, 46.41784),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	--Prison Kitchen 2
	{
		objHash = -1612152164,
		objHeading = 360.0,
		objCoords = vector3(1780.229, 2588.546, 44.77826),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		slides = true,
	},

	--Solitary 1
	{
		objHash = -688867873,
		objHeading = 180.0,
		objCoords = vector3(1779.686, 2597.193, 45.84176),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},	

	--Solitary 2
	{
		objHash = -688867873,
		objHeading = 180.0,
		objCoords = vector3(1776.77400, 2597.177, 45.84028),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},	

	--Solitary 3
	{
		objHash = -688867873,
		objHeading = 180.0,
		objCoords = vector3(1773.817, 2597.145, 45.84278),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.0,
		fixText = true,
	},	

	--Solitary 4
	{
		objHash = -688867873,
		objHeading = 90.0,
		objCoords = vector3(1772.605, 2598.878, 45.83304),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.0,
	},	

	--Cellblock Entrance Side Door
	{
		objHash = -1033001619,
		objHeading = 180.0,
		objCoords = vector3(1786.36900, 2600.21800, 45.99691),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},	

	--Hallway
	{
		authorizedJobs = { 'police', 'fireman', 'corrections' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -1033001619, objHeading = 270.0, objCoords = vector3(1791.08100, 2595.06300, 46.21595)},
			{objHash = -1033001619, objHeading = 90.0, objCoords = vector3(1791.07900, 2592.46200, 46.21595)}
		},
		fixText = true,
		
	},

	--Reception Gate
	{
		objHash = -1612152164,
		objHeading = 0.0,
		objCoords = vector3(1839.60300, 2588.29800, 44.95166),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 2.5,
		slides = true,
	},	

	--Reception Gate
	{
		objHash = -1612152164,
		objHeading = 90.0,
		objCoords = vector3(1836.55800, 2594.45200, 44.95167),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 2.5,
		slides = true,
	},	

	--Cellblock Overview Room
	{
		objHash = -1033001619,
		objHeading = 180.0,
		objCoords = vector3(1776.55600, 2588.41300, 49.86404),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},		

	--Towers
	{
		objHash = -1033001619,
		objHeading = 65.0,
		objCoords = vector3(1821.1700, 2476.2650, 45.68915),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	{
		objHash = -1033001619,
		objHeading = 25.0,
		objCoords = vector3(1759.6200, 2412.9370, 45.71166),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	{
		objHash = -1033001619,
		objHeading = 355.0,
		objCoords = vector3(1658.5840, 2397.7220, 45.71526),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	{
		objHash = -1033001619,
		objHeading = 290.0,
		objCoords = vector3(1543.2410, 2471.2940, 45.71201),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	{
		objHash = -1033001619,
		objHeading = 270.0,
		objCoords = vector3(1537.8110, 2585.9950, 45.68915),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	{
		objHash = -1033001619,
		objHeading = 235.0,
		objCoords = vector3(1572.6620, 2679.1910, 45.72976),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	{
		objHash = -1033001619,
		objHeading = 200.142,
		objCoords = vector3(1651.1610, 2755.43600, 45.87868),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	{
		objHash = -1033001619,
		objHeading = 165.0,
		objCoords = vector3(1773.1080, 2759.70, 45.88673),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	{
		objHash = -1033001619,
		objHeading = 95.0,
		objCoords = vector3(1845.7900, 2698.6210, 45.95531),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	{
		objHash = -1033001619,
		objHeading = 85.0,
		objCoords = vector3(1820.7700, 2620.7700, 45.95126),
		authorizedJobs = { 'police', 'corrections', 'fireman' },
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},


 ---------------------------------------
 --		PACIFIC STANDARD BANK		--
 ---------------------------------------

	-- PSB
	{
		objHash = 746855201,
		objHeading = 250.0,
		objCoords = vector3(261.99899291992, 221.50576782227, 106.68346405029),
		authorizedJobs = { 'police', 'fireman' },
		locked = true,
		maxDistance = 2.5,
	},

 -------------------------------------
 --	   PILLBOX MEDICAL - UPPER     --
 -------------------------------------

	--Brake Room Door
	{
		objHash = 854291622,
		objHeading = 160.0,
		objCoords = vector3(309.13370, -597.75150, 43.43391),
		authorizedJobs = { 'ambulance', 'fireman' },
		locked = true,
		maxDistance = 1.5,
	},

	--Pharmacy
	{
		objHash = 854291622,
		objHeading = 340.0,
		objCoords = vector3(307.11820, -569.56900, 43.43391),
		authorizedJobs = { 'ambulance', 'fireman'},
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Directors Office
	{
		objHash = 854291622,
		objHeading = 340.0,
		objCoords = vector3(336.86650, -592.57880, 43.43391),
		authorizedJobs = { 'ambulance', 'fireman'},
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

 -------------------------------------
 --	   PILLBOX MEDICAL - LOWER     --
 -------------------------------------

	--Surgery Hallway Left
	{
		authorizedJobs = { 'ambulance', 'fireman' },
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -770740285, objHeading = 250.0, objCoords = vector3(333.78550, -593.40550, 28.80227)},
			{objHash = -770740285, objHeading = 70.0, objCoords = vector3(334.57540, -591.24450, 28.80277)}
		},
	},

	--Morgue Door
	{
		authorizedJobs = { 'ambulance', 'fireman', 'offambulance', 'police' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -770740285, objHeading = 160.0, objCoords = vector3(312.7215, -580.4204, 28.81984)},
			{objHash = -770740285, objHeading = 340.0, objCoords = vector3(314.8836, -581.2076, 28.81984)}
		},
	},

	--Surgery Hallway Right
	{
		authorizedJobs = { 'ambulance', 'fireman', 'offambulance' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -770740285, objHeading = 250.0, objCoords = vector3(341.39200, -572.50710, 28.81897)},
			{objHash = -770740285, objHeading = 70.0, objCoords = vector3(342.17840, -570.34730, 28.81897)}
		},
	},

	--Lookout Room
	{
		authorizedJobs = { 'ambulance', 'fireman' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -770740285, objHeading = 70.0, objCoords = vector3(346.81810, -572.02560, 28.79730)},
			{objHash = -770740285, objHeading = 250.0, objCoords = vector3(346.03100, -574.18880, 28.79730)}
		},
	},
	
	--Infirmary
	{
		authorizedJobs = { 'ambulance', 'fireman', 'police' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -770740285, objHeading = 160.0, objCoords = vector3(345.05860, -567.96480, 28.82051)},
			{objHash = -770740285, objHeading = 340.0, objCoords = vector3(347.22670, -568.73330, 28.82051)}
		},
	},

	--Reception
	{
		objHash = 1653893025,
		objHeading = 250.0,
		objCoords = vector3(337.15, -583.43, 28.79),
		authorizedJobs = { 'ambulance', 'fireman', 'offambulance'},
		locked = true,
		maxDistance = 1.5,
		fixText = true,
	},

	--Locker Room
	{
		objHash = 1653893025,
		objHeading = 160.0,
		objCoords = vector3(333.65, -587.85, 28.79),
		authorizedJobs = { 'ambulance', 'fireman', 'offambulance'},
		locked = true,
		maxDistance = 1.5,
		fixText = true
	},

	--CME Office
	{
		objHash = 1859711902,
		objHeading = 160.0,
		objCoords = vector3(323.7196, -590.7124, 28.93845),
		authorizedJobs = { 'ambulance', 'fireman'},
		locked = false,
		maxDistance = 1.5,
		fixText = true
	},

	--Back Parking Door
	{
		authorizedJobs = { 'ambulance', 'fireman' },
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -1920147247, objHeading = 207.0, objCoords = vector3(318.76770, -561.01980, 28.88031)},
			{objHash = -1920147247, objHeading = 26.0, objCoords = vector3(321.00880, -559.96090, 28.88031)}
		},
		fixText = true,
	},

 -------------------------------------
 --	        SANDY MEDICAL           --
 -------------------------------------

	--Doctor's Office
	{
		objHash = -770740285,
		objHeading = 210.0,
		objCoords = vector3(1840.7150, 3681.7490, 34.29562),
		authorizedJobs = { 'ambulance', 'fireman'},
		locked = true,
		maxDistance = 1.5,
		fixText = true
	},

	--LockerRoom
	{
		objHash = -770740285,
		objHeading = 120.0,
		objCoords = vector3(1826.8880, 3676.3950, 34.29776),
		authorizedJobs = { 'ambulance', 'fireman'},
		locked = true,
		maxDistance = 1.5,
		fixText = true
	},

	--Wards Double 
	{
		authorizedJobs = { 'ambulance', 'fireman' },
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -1143010057, objHeading = 120.0, objCoords = vector3(1827.8590, 3672.2880, 34.42281)},
			{objHash = -1143010057, objHeading = 300.0, objCoords = vector3(1829.1630, 3670.0420, 34.42281)}
		},
	},

	--Hallway 1 
	{
		authorizedJobs = { 'ambulance', 'fireman' },
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -1143010057, objHeading = 120.0, objCoords = vector3(1830.0930, 3683.3670, 34.42281)},
			{objHash = -1143010057, objHeading = 300.0, objCoords = vector3(1831.3940, 3681.1140, 34.42281)}
		},
	},

	--Hallway 2 
	{
		authorizedJobs = { 'ambulance', 'fireman' },
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = -1143010057, objHeading = 120.0, objCoords = vector3(1824.6690, 3680.2340, 34.42281)},
			{objHash = -1143010057, objHeading = 300.0, objCoords = vector3(1825.9710, 3677.9810, 34.42281)}
		},
	},
	
}

Citizen.CreateThread(function()
	Citizen.Wait(5)
	if CustomDoors[1] == nil then --[[no doors]] else
		for k, v in pairs(CustomDoors) do
			table.insert(Config.DoorList, v)
		end
	end
end)