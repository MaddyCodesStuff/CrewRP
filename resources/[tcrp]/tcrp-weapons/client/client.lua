Citizen.CreateThread(function()
    AddTextEntry('WT_HUNT_RIFLE', 'Hunting Rifle')
    AddTextEntry('WT_REVOLVER', 'Revolver')
    AddTextEntry('WT_REVOLVER2', 'Heavy Revolver')
    AddTextEntry('WT_STUN', 'Taser')
    AddTextEntry('WT_GL_SMOKE', 'Smoke Grenade Launcher')
    AddTextEntry('WT_GNADE_SMK', 'Smoke Grenade')
    AddTextEntry('WT_BZGAS', 'Tear Gas')
end) 
--Defines Weapon-Wheel Name for Weapon
 
SetFlashLightKeepOnWhileMoving(true)
SetWeaponsNoAutoswap(true)
SetPedSuffersCriticalHits(PlayerPedId(), false)