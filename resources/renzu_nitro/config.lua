Config = {}

Config.Mysql = 'mysql-async'
Config.weight_type = false
Config.weight = 1.5
Config.jobonly = true
Config.nitrojob = 'mecano'

-- JOB ITEMS --
Config.nitros = {
	['50shot'] = {Power = 1.05, Torque = 1.8, value = 15000}, 
	['100shot'] = {Power = 1.10, Torque = 2.0, value = 25000}, 
	['200shot'] = {Power = 1.15, Torque = 3.5, value = 45000}, 
}
Config.nitro_bottles = {
	['nitro_bottle'] = {tick = 0.05, weight = 30.0, label = 'Nitro Bottle 10LB'}, -- weight is not the weight of item, its the additional weight to vehicle
}
-- JOB ITEMS --

Config.refills = 100 -- cost per tick
Config.refillstation = {
	-- [1] = {coord = vector3(-216.4362487793,-1324.8597412109,30.606903076172), job = 'all'}, -- if all any players can use this refill station
	-- add as many as you want, this is like a fuel station logic
}
Config.exhaust_bones = {
	"exhaust",
	"exhaust_2",
	"exhaust_3",
	"exhaust_4",
} 

Config.tailights_bone = {
	--"taillight_l",
	--"taillight_r",
	--"taillight_m",
}
Config.nitroasset = "core"

Config.exhaust_particle_name = "veh_backfire" -- particle name | default: "veh_backfire"
Config.trail_particle_name = "veh_light_red_trail"
Config.exhaust_flame_size = 1.3
Config.trail_size = 1.00
Config.bannedindex = -1
Config.purge_left_bone = "wheel_lf"
Config.purge_right_bone = "wheel_rf"
Config.purge_size = 1.0
Config.purge_paticle_name = "ent_sht_steam" -- particle name | default: "ent_sht_steam"