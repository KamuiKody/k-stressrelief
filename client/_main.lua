local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:UpdateObject', function()
	QBCore = exports['qb-core']:GetCoreObject()
end)

local function notify(title, msg, _type, duration) -- change notify here
    QBCore.Functions.Notify(msg, _type, duration)
    --exports['notify']:Alert(_type, title, msg, duration)
end
RegisterNetEvent('k-stressrelief:client:notify', notify)

RegisterNetEvent('k-stressrelief:client:useItem', function(itemName, itemSlot)
    if not QBCore.Functions.HasItem(itemName) then return notify(Lang:t('error.title'), Lang:t('error.label'), 'error', 5000) end -- change HasItem here
    local itemData = Config.Items[itemName]
    TriggerEvent('animations:client:EmoteCommandStart', {itemData.emoteName}) -- change emote event here
    QBCore.Functions.Progressbar('releive_stress', itemData.progressLabel, itemData.timeLength * 1000, false, itemData.canCancel, {
        disableMovement = itemData.canWalk,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {'c'}) -- change emote event here
        TriggerServerEvent('k-stressrelief:server:relive_stress', itemName, itemSlot)
    end, function()
        TriggerEvent('animations:client:EmoteCommandStart', {'c'}) -- change emote event here
    end)
end)
