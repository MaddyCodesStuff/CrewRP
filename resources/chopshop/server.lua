local chop = class("vrp_chopshop", vRP.Extension)

-- Items
vRP.EXT.Inventory:defineItem("plastics", "Plastics", "Material that is composed of reusable plastic", nil, 0.4)
vRP.EXT.Inventory:defineItem("metals", "Metals", "Material that is composed of reusable metal", nil, 1.0)
vRP.EXT.Inventory:defineItem("electronics", "Electronics", "Electronics that can be repurposed for other items", nil,
                             0.65)
vRP.EXT.Inventory:defineItem("rubbers", "Rubbers", "Material that is composed of reusable rubber", nil, 0.7)
vRP.EXT.Inventory:defineItem("glasses", "Glasses", "Material that is composed of reusable glass", nil, 0.75)

local function bind_informer(self, user)

    if self.informer then
        local x, y, z = table.unpack(self.informer)

        local function enter(user)

            math.randomseed(os.time())
            local car_chop = false
            model          = self.remote.getVehicleData(user.source)

            for k, v in pairs(self.car_list) do
                if model == string.upper(v.model) and not car_chop then
                    table.remove(self.car_list, k)
                    car_chop = true
                end
            end

            if car_chop == true then
                self.remote._getOutTheDamnCar(user.source)
                self.remote._setProgressBar(user.source, 30000, "Chopping car")
                SetTimeout(20000, function()
                    self.remote._chopCarFinished(user.source)

                    SetTimeout(10000, function()
                        local amt = math.random(2000, 5000)
                        user:giveWallet(amt)
                        msg = "You received $" .. tostring(amt)
                        TriggerClientEvent("pNotify:SendNotification", user.source,
                                           { layout = "centerRight", type = "success", text = msg, timeout = 10000 })

                        user:tryGiveItem("plastics", math.random(1, 30))
                        user:tryGiveItem("glasses", math.random(1, 20))
                        user:tryGiveItem("metals", math.random(1, 30))
                        user:tryGiveItem("electronics", math.random(1, 4))
                        user:tryGiveItem("rubber", math.random(1, 10))

                        msg = "You received several items to your inventory."
                        TriggerClientEvent("pNotify:SendNotification", user.source,
                                           { layout = "centerRight", type = "success", text = msg, timeout = 5000 })
                    end)
                end)
            else
                msg = "This car is not on the chop list. Someone may have delivered it before you. This is a " .. model
                TriggerClientEvent("pNotify:SendNotification", user.source,
                                   { layout = "centerRight", type = "error", text = msg, timeout = 5000 })
            end

        end

        local function leave(user)
        end

        user:setArea("vRP:chop", x, y, z - 0.5, 3, 1.5, enter, leave)

    end
end

function chop:__construct()
    vRP.Extension.__construct(self)

    self.cfg      = module("vrp_chopshop", "cfg/chopshop")
    self.car_list = {}

    math.randomseed(os.time())

    print("Placement Task")

    local function despawnInformant()
        for id, user in pairs(vRP.users) do
            self.remote._despawnPed(user.source)
        end
    end

    local function informer_placement_task()
        -- subsequent placements
        SetTimeout(self.cfg.chop_duration * 60000, informer_placement_task)
        SetTimeout(self.cfg.informant_duration * 60000, despawnInformant)

        -- spawn informer
        self:spawnInformer()
        self:pick_cars()

    end

    -- initial placement
    SetTimeout(90000, informer_placement_task)
end

function chop:pick_cars()
    self.car_list = {}
    for i = 1, 15 do
        table.insert(self.car_list, 1, self.cfg.cars[math.random(1, #self.cfg.cars)])
    end
end

function chop:spawnInformer()

    math.randomseed(os.time())
    self:despawnInformer()
    self.informer   = self.cfg.locations[math.random(1, #self.cfg.locations)]

    local informant = self.cfg.informant[math.random(1, #self.cfg.informant)]

    for id, user in pairs(vRP.users) do
        bind_informer(self, user)
        if not user:hasGroup("police") and not user:hasGroup("emergency") then
            self.remote._spawnPed(user.source, informant)
        end
    end
end

function chop:despawnInformer()

    if self.informer then
        for id, user in pairs(vRP.users) do
            -- remove informer data for all users
            vRP.EXT.Map.remote._removeEntity(user.source, "vRP:chop")
            user:removeArea("vRP:chop")
            self.remote._unmarkMap(user.source)
            self.remote._despawnPed(user.source)
        end
        self.informer = nil
    end

end

function chop:getCarList()
    for k, v in pairs(self.car_list) do
        msg = msg .. v.name
        if k < #self.car_list then
            msg = msg .. ", "
        end
    end
    return msg
end

chop.tunnel = {}

function chop.tunnel:send_sms()

    local user  = vRP.users_by_source[source]
    local phone = user.identity.phone

    msg         = "I marked a location. Car list: "
    msg         = self:getCarList()
    user:sendSMS(phone, msg)

    self.remote._markMap(user.source, self.informer)

end

chop.event = {}

function chop.event:playerSpawn(user, first_spawn)
    if first_spawn then
        bind_informer(self, user)
    end
end

--Informer, ya' no say daddy me Snow me I go blame. A licky boom boom down

