local QBCore = exports['qb-core']:GetCoreObject()

local function notify(src, title, msg, _type, duration)
    TriggerClientEvent('k-stressrelief:client:notify', src, title, msg, _type, duration)
end

RegisterServerEvent('k-stressrelief:server:relive_stress', function(itemName, itemSlot) -- inventory metadata stuff here
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemBySlot(itemSlot)
    if not item or item.name ~= itemName then return notify(src, Lang:t('error.title'), Lang:t('error.label'), 'error', 5000) end
    if not item.info.quality then item.info.quality = 100 end
    local itemData = Config.Items[itemName]
    item.info.quality -= itemData.amountUsed
    Player.PlayerData.items[itemSlot] = item
    Player.Functions.SetInventory(Player.PlayerData.items, true)
    if item.info.quality <= 0 then
        if not Player.Functions.RemoveItem(itemName, 1, itemSlot) then return notify(src, Lang:t('error.title'), Lang:t('error.label'), 'error', 5000) end
    end
    if not Player.PlayerData.metadata.stress then Player.PlayerData.metadata.stress = 0 end
    local newStress = Player.PlayerData.metadata.stress + itemData.stress
    Player.Functions.SetMetaData('stress', newStress)
    notify(src, Lang:t('success.title'), Lang:t('success.label'), 'success', 5000)
end)

RegisterServerEvent('QBCore:Server:UpdateObject', function()
    if source ~= '' then return false end
    QBCore = exports['qb-core']:GetCoreObject()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    if Config.Items then exports['qb-core']:AddItems(Config.Items) end
    for name, itemData in pairs(Config.Items) do      
        local sourcePath = sourceDirectory .. v.image
        local destinationPath = inventoryImagePath .. v.image
        CopyFile(sourcePath, destinationPath)
        QBCore.Functions.CreateUseableItem(name , function(source, item)
            local Player = QBCore.Functions.GetPlayer(source)
            if not Player.Functions.GetItemBySlot(item.slot) then return notify(src, Lang:t('error.title'), Lang:t('error.label'), 'error', 5000) end
            TriggerClientEvent('k-stressrelief:client:useItem', source, name, item.slot)
        end)
    end
end)
