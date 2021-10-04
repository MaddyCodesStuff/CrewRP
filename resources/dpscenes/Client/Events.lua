RegisterNetEvent("Scene:Recieve")
AddEventHandler("Scene:Recieve", function(scene, id)
	if id ~= 0 then
		distancetimer = 0
		Scenes[id] = scene
	else
		Chat(Lang("SceneError"))
	end
end)

RegisterNetEvent("Scene:Cache")
AddEventHandler("Scene:Cache", function(cache)
	Cache.Time = cache.Time
end)

RegisterNetEvent("Scene:Delete")
AddEventHandler("Scene:Delete", function(id)
	Scenes[id] = nil
end)


RegisterNetEvent("Scene:Reset")
AddEventHandler("Scene:Reset", function(Override)
	IsAdmin = false
	ResetScene()
end)

RegisterNetEvent("Scene:RecieveAll")
AddEventHandler("Scene:RecieveAll", function(scenes)
	distancetimer = 0
	Scenes = scenes
end)

RegisterNetEvent("Scene:Create")
AddEventHandler("Scene:Create", function(T, Override)
	distancetimer = 0
	Scene.Text.Text = T
	if not Scene.State then
		IsAdmin = Override
		Scene.State = "Placing"
	end
end)

LastCopiedScene = nil
RegisterNetEvent("Scene:RecieveCopy")
AddEventHandler("Scene:RecieveCopy", function(T, Override)
	LastCopiedScene = T
	Scene = T
	if not Scene.State then
		IsAdmin = Override
		Scene.State = "Placing"
	end
end)

RegisterNetEvent("Scene:RecieveMove")
AddEventHandler("Scene:RecieveMove", function(T, id, Override)
	if not Scene.State then
		IsAdmin = Override
		StartMoveScene(T, id)
	end
end)