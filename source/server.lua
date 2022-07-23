local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("ND_Fuel:pay", function(amount)
    local playerx = source
    local Player = QBCore.Functions.GetPlayer(playerx)

    if Player.Functions.RemoveMoney('cash', math.floor(amount), 'fuel-charge') then
        TriggerClientEvent('QBCore:Notify', playerx, "Paid: $" .. string.format("%.2f", amount) .. " for gas.", 'success')
    end
end)

RegisterNetEvent("ND_Fuel:jerryCan", function(amount)
    local playerx = source
    local Player = QBCore.Functions.GetPlayer(playerx)

    if Player.Functions.RemoveMoney('cash', math.floor(amount), 'jerrycan-charge') then
        Player.Functions.AddItem("jerry_can", 1)
        TriggerClientEvent('inventory:client:ItemBox', playerx, QBCore.Shared.Items["jerry_can"], 'add')
        TriggerClientEvent('QBCore:Notify', playerx, "Paid: $" .. amount .. " for Jerry Can.", 'success')
    end
end)

QBCore.Functions.CreateUseableItem("jerry_can", function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	local itemData = Player.Functions.GetItemBySlot(item.slot)
	if Player.Functions.GetItemBySlot(item.slot) then
        TriggerClientEvent("ND_Fuel:useJerryCan", source, itemData.amount)
    end
end)

QBCore.Functions.CreateCallback('ND_Fuel:removeJerry', function(source, cb) 
    local playerx = source
    local Player = QBCore.Functions.GetPlayer(playerx)

    if Player.Functions.RemoveItem("jerry_can", 1) then
        TriggerClientEvent('inventory:client:ItemBox', playerx, QBCore.Shared.Items["jerry_can"], 'remove')
        cb(true)
    else
        cb(false)
    end
end)