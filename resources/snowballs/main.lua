RegisterCommand('snowball',function(source,args)
	GiveWeaponToPed(PlayerPedId(), GetHashKey('weapon_snowball'), 10, false, false)
end)
