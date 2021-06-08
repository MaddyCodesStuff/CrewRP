local callback;

RegisterNetEvent('tcrp-input:OpenInput')
AddEventHandler('tcrp-input:OpenInput', function(label, type, limit, cb)
    callback = cb;
    SetNuiFocus(true, true);
    SendNUIMessage({
                       action = "open",
                       label  = label,
                       type   = type,
                       limit  = limit
                   })
end)

RegisterNUICallback('submit', function(data)
    SetNuiFocus(false);
    callback(data.value);
end)