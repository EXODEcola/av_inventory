-- YOU CAN ADD YOUR CALLBACKS HERE!

RegisterNetEvent('AquiverInventory:Player:addItem')
RegisterNetEvent('AquiverInventory:Player:removeItem')

AddEventHandler('AquiverInventory:Player:addItem', function(item, count, vars, cb) -- this is not callback, simple event to give item to player.
    local source = source
    local identifier = Config.getIdentifier(source)
    if AquiverInventories[identifier] then
        AquiverInventories[identifier].addItem(item, count, vars, function(response)
            if cb then cb(response) end
        end)
    end
end)

AddEventHandler('AquiverInventory:Player:removeItem', function(item, count, cb) -- this is not callback, simple event to remove item from player
    local source = source
    local identifier = Config.getIdentifier(source)
    if AquiverInventories[identifier] then
        AquiverInventories[identifier].removeItem(item, count, function(response)
            if cb then cb(response) end
        end)
    end
end)

-- -- example ESX callbacks
-- ESX.RegisterServerCallback('AquiverInventory:CB:addItem', function(source, cb, item, count)
--     local identifier = Config.getIdentifier(source)
--     if AquiverInventories[identifier] then
--         AquiverInventories[identifier].addItem(item, count, function(success)
--             cb(success)
--         end)
--     end
-- end)
-- ESX.RegisterServerCallback('AquiverInventory:CB:removeItem', function(source, cb, item, count)
--     local identifier = Config.getIdentifier(source)
--     if AquiverInventories[identifier] then
--         AquiverInventories[identifier].removeItem(item, count, function(sucess)
--             cb(success)
--         end)
--     end
-- end)