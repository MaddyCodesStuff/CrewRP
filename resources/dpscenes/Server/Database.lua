ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

DB = {}

function PrepareSceneForDatabase(i)
	-- Here we just clear some of the data thats not needed but other players.
	local s = i; s.State = nil s.Info = nil s.Background.ColourName = nil
	if s.Hours > Config.MaxSceneLength then s.Hours = Config.MaxSceneLength end
	return json.encode(s)
end

function AdminCheck(Src, Identifier)
	local xPlayer = ESX.GetPlayerFromId(Src)
	if xPlayer.getGroup() == 'superadmin' or xPlayer.getGroup() == 'admin' then
		return true
	else
		return false
	end
end

RegisterNetEvent("Scene:New")
AddEventHandler("Scene:New", function(New)
	local Src = source
	local Id = GetLicense(Src, Config.IdentifierType)
	local Count = CountScenes(Id)
	local Override = AdminCheck(Src, Me)
	if Count < Config.MaxScenes or Override then
		if not CloseToOtherScene(New) then
			local NewScene = PrepareSceneForDatabase(New)
			local CreationTime = os.time()
			DB.NewScene(New, Src, Id, CreationTime, NewScene)
			TriggerClientEvent("Scene:Reset", Src)
		else
			Chat(Src, Lang("TooClose"))
		end
	else
		Chat(Src, string.format(Lang("TooMany"), Count))
	end
end)

RegisterNetEvent("Scene:AttemptDelete")
AddEventHandler("Scene:AttemptDelete", function(Id, Move)
	local Src = source
	local Me = GetLicense(Src, Config.IdentifierType)
	local SceneToDelete = Scenes.Current[Id]
	local Override = AdminCheck(Src, Me)
	if not Move then
		if Me == SceneToDelete.Owner or SceneToDelete.AnyDelete == 1 or Override then
			DB.RemoveScene(Id)
			Chat(Src, Lang("RemovedScene"))
		else
			Chat(Src, Lang("NoPerms"))
		end
	else
		DB.RemoveScene(Id)
	end
end)

RegisterNetEvent("Scene:OwnerCheck")
AddEventHandler("Scene:OwnerCheck", function(Id)
	local Src = source
	local Me = GetLicense(Src, Config.IdentifierType)
	local SceneToRelay = Scenes.Current[Id]
	local Override = AdminCheck(Src, Me)
	if Override then
		Chat(Src, Lang("SceneOwner") .. SceneToRelay.Owner)
	else
		Chat(Src, Lang("NoPerms"))
	end
end)

RegisterNetEvent("Scene:AttemptCopy")
AddEventHandler("Scene:AttemptCopy", function(Id)
	local Src = source
	local Me = GetLicense(Src, Config.IdentifierType)
	local SceneToCopy = Scenes.Current[Id]
	local Override = AdminCheck(Src, Me)
	if Me == SceneToCopy.Owner or Override then
		TriggerClientEvent("Scene:RecieveCopy", Src, SceneToCopy, Override)
	else
		Chat(Src, Lang("OnlyCopyOwn"))
	end
end)