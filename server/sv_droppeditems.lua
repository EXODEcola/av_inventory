droppedItems = {}

RegisterNetEvent('AquiverInventory:pickupItem')
RegisterNetEvent('nui:AquiverInventory:throwItem')

AddEventHandler('nui:AquiverInventory:throwItem', function(data, pos)
    local source = source
    local index = data.index
    local count = tonumber(data.count)

    local identifier = Config.getIdentifier(source)
    if AquiverInventories[identifier] then
        local playerInventory = AquiverInventories[identifier].getInventory()
        if not playerInventory or not playerInventory[index] or not playerInventory[index].itemdata then return end

        if not playerInventory[index].itemdata.tradable then
            return Functions.SendNotification(source, _U('item_not_droppable'), 'error')
        end

        if count > playerInventory[index].quantity then
            count = playerInventory[index].quantity
        end

        local playeritem = json.decode(json.encode(playerInventory[index]))

        local success = AquiverInventories[identifier].removeItemAtSlot(index, count)
        if success then
            playeritem.quantity = count
            createDroppedItem(pos, playeritem)
        end
    end
end)

function createDroppedItem(pos, item)
   local id = uniqueId()
   droppedItems[id] = {
        item = item,
        pos = pos
   }
   TriggerClientEvent('AquiverInventory:addDroppedItem', -1, id, droppedItems[id])
end

function uniqueId()
    local id = math.random(1, 99999)
    while droppedItems[id] do
        id = math.random(1, 99999)
    end
    return id
end

AddEventHandler('AquiverInventory:pickupItem', function(id)
    local source = source
    local identifier = Config.getIdentifier(source)

    if not AquiverInventories[identifier] then return end

    if droppedItems[id] then
        local success = AquiverInventories[identifier].addItem(droppedItems[id].item.item, droppedItems[id].item.quantity)
        if success then
            droppedItems[id] = nil
            TriggerClientEvent('AquiverInventory:removeDroppedItem', -1, id)
        end
    end
end)

AddEventHandler('playerJoining', function()
    TriggerClientEvent('AquiverInventory:spawnDroppedItems', source, droppedItems)
end)