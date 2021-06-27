ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Perform the movement on the nui
function MoveNui(value)
    SendNUIMessage({
        ui = "Keys",
        mover = value
    })
end

-- Create the icons on the map
function CreateIcons()
	for i, k in pairs(tattoosShops) do
		if k.blip then
            local BlipMap = AddBlipForCoord(k.coords.x, k.coords.y, k.coords.z)
            SetBlipSprite(BlipMap, 75)
            SetBlipColour(BlipMap, 1)
            SetBlipScale(BlipMap, 1.0)
            SetBlipAsShortRange(BlipMap, true)
            AddTextEntry("BlipMap", "Tattoo Shop")
            BeginTextCommandSetBlipName("BlipMap")
            AddTextComponentSubstringBlipName(BlipMap)
            EndTextCommandSetBlipName(BlipMap)
        end 
	end
end

-- Add or remove vector tattoos
function AddRemoveTattoo(add, vector, dlc, hash)
    local ped = PlayerPedId()
    ClearPedDecorations(ped)

    local indice = 1
    local found = false
    for i, k in pairs(vector) do
        if k.dlc == dlc and k.hash == hash then
            found = true
            indice = i
            break
        end
    end

    if add then
        if not found then
            table.insert(vector, {dlc=dlc,hash=hash})
        end
    else
        if found then
            table.remove(vector, indice)
        end
    end
end

-- Displays notifications on the nui
function ShowNotify(data, num, bool)
    SendNUIMessage({
        ui = "Added",
        dlc = data.mx.dlc,
        add = num,
    })

    SendNUIMessage({
        ui = "Info",
        dlc = data.mx.dlc,
        possui = bool
    })
end

-- Checks whether the player has the selected tattoo
function HasTattoo(dlc, hash)
    for i, k in pairs(update_tattoos) do
        if k.hash == hash and k.dlc == dlc then
            return true
        end
    end
    return false
end

-- Checks whether the player has purchiced this tattoo Previously
function HasTattooCurrently(dlc, hash)
    for i, k in pairs(my_tattoos) do
        if k.hash == hash and k.dlc == dlc then
            return true
        end
    end
    return false
end

-- Calculates the price of tattoos
function PriceTattoos(type, dlc)
    if type ~= "" then
        for h, j in pairs(tattoos_list) do 
            if dlc == j.dlc then
                if type == "+" then
                    tattoos_price = tattoos_price + j.price
                else
                    tattoos_price = tattoos_price - j.price
                end
            end
        end

        if tattoos_price < 0 then
            tattoos_price = 0
        end
    end
end

-- Complete registration
function RegisterTattoos()
    TriggerServerEvent("Mx :: RegisterTattoos", update_tattoos, tattoos_price, freetattoos)
    update_tattoos = {}

    local ped = PlayerPedId()
    ClearPedDecorations(ped)
end

-- Get the sex of the ped
function GetModel()
    local body_model = "male"
    local model_ped = GetEntityModel(PlayerPedId())
    if model_ped == GetHashKey("mp_f_freemode_01") then
        body_model = "female"
    end
    return body_model
end

-- Removes or Replaces the clothes on the ped
function HideClothes(ocultar, enable_opcao)
    if enable_opcao then
        local ped = PlayerPedId()

        if not ocultar then
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
        else
            TriggerEvent('skinchanger:getSkin', function(skin)
                if skin.sex == 0 then
                    TriggerEvent('skinchanger:loadSkin', {
                        sex      = 0,
                        ears_1 = -1,
                        ears_2 = 0,
                        tshirt_1 = 15,
                        tshirt_2 = 0,
                        arms     = 15,
                        torso_1  = 91,
                        torso_2  = 0,
                        decals_1 = 0,
                        decals_2 = 0,
                        pants_1  = 61,
                        pants_2  = 5,
                        shoes_1 = 34,
                        shoes_2 = 0,
                        mask_1 = 0,
                        mask_2 = 0,
                        bproof_1 = 0,
                        bproof_2 = 0,
                        chain_1 = 0,
                        chain_2 = 0,
                        helmet_1 = -1,
                        helmet_2 = 0,
                        glasses_1 = 0,
                        glasses_2 = 0,
                        bags_1 = 0,
                        bags_2 = 0
                    })
                else
                    TriggerEvent('skinchanger:loadSkin', {
                        sex      = 1,
                        ears_1 = -1,
                        ears_2 = 0,
                        tshirt_1 = 34,
                        tshirt_2 = 0,
                        decals_1 = 0,
                        decals_2 = 0,
                        arms     = 15,
                        torso_1  = 18,
                        torso_2  = 0,
                        pants_1  = 17,
                        pants_2  = 0,
                        shoes_1 = 35,
                        shoes_2 = 0,
                        mask_1 = 0,
                        mask_2 = 0,
                        bproof_1 = 0,
                        bproof_2 = 0,
                        chain_1 = 0,
                        chain_2 = 0,
                        helmet_1 = -1,
                        helmet_2 = 0,
                        glasses_1 = 5,
                        glasses_2 = 0,
                        bags_1 = 0,
                        bags_2 = 0
                    })
                end
            end)
        end
    end
end

-- Stock notify
function Notify(text)
    ESX.ShowNotification(text)
end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel (0, 0, 1, -1)
end