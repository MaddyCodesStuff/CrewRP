local beingTracked   = 0
local blipExpireTime = 0

--[[ Marker loop ]]--
Citizen.CreateThread(function()
    while true do
        local wait   = 750
        local coords = GetEntityCoords(PlayerPedId())
        for i = 1, #Config.Locations do
            for j = 1, #Config.Locations[i]["shelfs"] do
                local pos  = Config.Locations[i]["shelfs"][j]
                local dist = #(coords - vector3(pos["x"], pos["y"], pos["z"]))
                if dist <= 5.0 then
                    if dist <= 1.5 then
                        local text = Config.Locales[pos["value"]]
                        if dist <= 1.0 and text then
                            text = "[E] " .. text
                            if IsControlJustPressed(0, Keys["E"]) then
                                OpenAction(pos, Config.Items[pos["value"]], Config.Locales[pos["value"]])
                            end
                        end
                        if text then
                            DrawText3D(pos["x"], pos["y"], pos["z"], text)
                        end
                    end
                    wait = 5
                    Marker(pos)
                end
            end
        end
        Citizen.Wait(wait)
    end
end)

--[[ Loop for checking if player is too far away, then they've stolen goods ]] --
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if payAmount > 0 then
            for shop = 1, #Config.Locations do
                local blip     = Config.Locations[shop]["blip"]
                local dist     = #(GetEntityCoords(PlayerPedId()) - vector3(blip["x"], blip["y"], blip["z"]))
                local rob_dist = Config.DefaultRobDist
                if Config.Locations[shop].rob_dist then
                    rob_dist = Config.Locations[shop].rob_dist
                end
                if dist <= rob_dist then
                    if dist >= (rob_dist - 5.0) then
                        ESX.TriggerServerCallback('99kr-shops:anycops', function(anycops)
                            if anycops >= Config.CopsRequired then
                                TriggerEvent('mythic_notify:client:SendSuccessAlert',
                                             { text = 'You left the store with goods! An alarm has been triggered and local PD is tracking you!' })
                                local itemsStolen = 0
                                local pdnote      = "Items reported stolen:\n"
                                for k, basketItem in pairs(Basket) do
                                    if itemsStolen < Config.MaxItemsStolen then
                                        Basket[k]["amount"] = 1
                                        itemsStolen         = itemsStolen + 1
                                        pdnote              = pdnote .. "- 1 x " .. Basket[k]["label"] .. "\n"
                                    else
                                        Basket[k] = nil
                                    end
                                end
                                TriggerServerEvent('99kr-shops:AddBasketToInventory', Basket)
                                TriggerServerEvent('99kr-shops:alertcops')
                                blipExpireTime = GetGameTimer() + Config.CopBlipTime
                                beingTracked   = 1
                                payAmount      = 0
                                TriggerServerEvent("server:newNote", pdnote, Config.Locations[shop]["blip"]["x"],
                                                   Config.Locations[shop]["blip"]["y"],
                                                   Config.Locations[shop]["blip"]["z"], true)
                                Basket = {}
                            else
                                TriggerEvent('mythic_notify:client:SendErrorAlert',
                                             { text = 'You tried to leave the store with goods! Your basket has been emptied (not enough cops to rob).' })
                                payAmount = 0
                                Basket    = {}
                            end
                        end)
                    end
                end
            end
        end
    end
end)

-- Track thief
Citizen.CreateThread(function()
    while true do
        if blipExpireTime >= GetGameTimer() and beingTracked == 1 then
            local coords = GetEntityCoords(GetPlayerPed(-1))
            TriggerServerEvent('99kr-shops:setcopblips', coords)
        elseif (beingTracked == 1) then
            beingTracked = 0
        end
        Citizen.Wait(Config.CopBlipInterval * 1000)
    end
end)

--[[ Check what to do ]]--
OpenAction      = function(action, shelf, text)
    if action["value"] == "checkout" then
        if #Basket > 0 then
            CashRegister(text)
        else
            pNotify("You don't have anything in your basket!", 'error', 1500)
        end
    else
        ShelfMenu(text, shelf)
    end
end

--[[ Cash register menu ]]--
CashRegister    = function(titel)
    local elements = {
        { label = '<span style="color:lightgreen; border-bottom: 1px solid lightgreen;">Confirm</span>', value = "yes" },
        { label = '<span style="color:red; border-bottom: 1px solid lightred;">Empty Cart</span>', value = "empty_cart" },
        { label = 'Amount to pay: $' .. payAmount .. '' },
    }

    for i = 1, #Basket do
        local item = Basket[i]
        table.insert(elements, {
            label = '<span style="color:red">*</span> ' .. item["label"] .. ': ' .. item["amount"] .. ' pcs',
            value = item["value"],
        })
    end

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'penis',
        {
            title    = titel,
            align    = 'center',
            elements = elements
        },
        function(data, menu)

            if data.current.value == "yes" then
                menu.close()
                ESX.UI.Menu.Open(
                    'default', GetCurrentResourceName(), 'penis2',
                    {
                        title    = "Shop - Payment",
                        align    = 'center',
                        elements = {
                            { label = "Pay with Cash", value = "cash" },
                            { label = "Pay with Credit Card", value = "bank" },
                        },
                    },
                    function(data2, menu2)
                        ESX.TriggerServerCallback('99kr-shops:CheckMoney', function(hasMoney)
                            if hasMoney then
                                TriggerServerEvent('99kr-shops:Cashier', payAmount, data2.current["value"])
                                TriggerServerEvent('99kr-shops:AddBasketToInventory', Basket)
                                TriggerServerEvent('esx_storeclerk:buy', payAmount)
                                payAmount = 0
                                Basket    = {}
                                menu2.close()
                            else
                                pNotify("You don't have enough money!", 'error', 1500)
                            end
                        end, payAmount, data2.current["value"])
                    end,
                    function(data2, menu2)
                        menu2.close()
                    end)
            elseif data.current.value == "empty_cart" then
                payAmount = 0
                Basket    = {}
                pNotify("Your cart has been emptied", 'error', 1500)
                menu.close()
            end
        end,
        function(data, menu)
            menu.close()
        end)
end

--[[ Open shelf menu ]]--
ShelfMenu       = function(titel, shelf)
    local elements = {}

    for i = 1, #shelf do
        local shelf = shelf[i]
        table.insert(elements, {
            realLabel = shelf["label"],
            label     = shelf["label"] .. ' ($' .. shelf["price"] .. ')',
            item      = shelf["item"],
            price     = shelf["price"],
            value     = 1, type = 'slider', min = 1, max = 100,
        })
    end
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'penis',
        {
            title    = titel,
            align    = 'center',
            elements = elements
        },
        function(data, menu)

            ESX.TriggerServerCallback('99kr-shops:carrycheck', function(canadd)
                local alreadyHave, basketItem = CheckBasketItem(data.current.item)
                if canadd then
                    if alreadyHave then
                        basketItem.amount = basketItem["amount"] + data.current.value
                    else
                        table.insert(Basket, {
                            label  = data.current["realLabel"],
                            value  = data.current["item"],
                            amount = data.current.value,
                            price  = data.current["price"]
                        })
                    end
                    payAmount = payAmount + data.current["price"] * data.current.value
                    pNotify("Put " .. data.current.value .. " pieces of " .. data.current["realLabel"] .. " in the basket",
                            'alert', 1500)
                else
                    pNotify("You're carrying too many " .. data.current["realLabel"] .. " Already!",
                            'alert', 1500)
                end
            end, data.current.item, data.current.value, CheckBasketNumber(data.current.item))
        end,
        function(data, menu)
            menu.close()
        end)
end

--[[ Check if item already in basket ]]--
CheckBasketItem = function(item)
    for i = 1, #Basket do
        if item == Basket[i]["value"] then
            return true, Basket[i]
        end
    end
    return false, nil
end

--[[ Check number of items in basket ]]--
CheckBasketNumber = function(item)
    for i = 1, #Basket do
        --print(Basket[i]["amount"] .. ' ' .. Basket[i]["value"] .. " Items in Basket")
        if item == Basket[i]["value"] then
            return Basket[i]["amount"]
        end
    end
end

--[[ Checks if key "L" is pressed ]]--
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if IsControlJustPressed(0, Keys["L"]) then
            OpenBasket()
        end
    end
end)

-- [[ Opens basket menu ]]--
OpenBasket = function()
    if payAmount > 0 and #Basket then
        local elements = {
            { label = 'Amount to pay: <span style="color:green">$' .. payAmount },
        }
        for i = 1, #Basket do
            local item = Basket[i]
            table.insert(elements, {
                label = '<span style="color:red">*</span> ' .. item["label"] .. ': ' .. item["amount"] .. ' pcs (<span style="color:green">$' .. item["price"] * item["amount"] .. '</span>)',
                value = "item_menu",
                index = i
            })
        end
        table.insert(elements, { label = '<span style="color:red">Empty Cart', value = "empty" })

        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'basket',
            {
                title    = "Shopping Cart",
                align    = 'center',
                elements = elements
            },
            function(data, menu)
                if data.current.value == 'empty' then
                    Basket    = {}
                    payAmount = 0
                    menu.close()
                    pNotify("Removed everything from your basket.", "error", 2500)
                end
                if data.current.value == "item_menu" then
                    menu.close()
                    local index    = data.current.index
                    local shopItem = Basket[index]

                    -- [[ Opens detailed (kinda) menu about item ]] --
                    ESX.UI.Menu.Open(
                        'default', GetCurrentResourceName(), 'basket_detailedmenu',
                        {
                            title    = "Shopping Cart - " .. shopItem["label"] .. " - " .. shopItem["amount"] .. "pcs",
                            align    = 'center',
                            elements = {
                                { label = shopItem["label"] .. " - $" .. shopItem["price"] * shopItem["amount"] },
                                { label = '<span style="color:red">Delete Item</span>', value = "deleteItem" },
                            },
                        },
                        function(data2, menu2)
                            if data2.current["value"] == "deleteItem" then
                                pNotify("Removed " .. Basket[index]["amount"] .. " " .. Basket[index]["label"] .. " from basket.",
                                        "alert", 2500)
                                payAmount = payAmount - (Basket[index]["amount"] * Basket[index]["price"])
                                table.remove(Basket, index)
                                OpenBasket()
                            end
                        end,
                        function(data2, menu2)
                            menu2.close()
                            OpenBasket()
                        end
                    )

                    -- [[ Back to normal basket menu ]] --
                end
            end,
            function(data, menu)
                menu.close()
            end
        )
    else
        ESX.UI.Menu.CloseAll()
    end
end
