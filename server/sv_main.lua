AquiverInventories = {}
playerOpenedInventories = {} -- we just save, which secondary inventory is opened, so players can not exploit from html requests

RegisterNetEvent('AquiverInventory:removeSecondary')
RegisterNetEvent('nui:AquiverInventory:moveToSecond')
RegisterNetEvent('nui:AquiverInventory:moveToFirst')
RegisterNetEvent('nui:AquiverInventory:instantToMain')
RegisterNetEvent('nui:AquiverInventory:instantToSecond')
RegisterNetEvent('nui:AquiverInventory:useItem')
RegisterNetEvent('nui:AquiverInventory:moveInside')
RegisterNetEvent('AquiverInventory:openSecondInventory')
RegisterNetEvent('nui:AquiverInventory:giveItemToTarget')
RegisterNetEvent('baseevents:onPlayerDied')

function createInventory(inventorytype, owner, playerSrc, slots, maxweight)
    local self = {}

    self.inventorytype = inventorytype
    self.owner = owner
    self.playerSrc = playerSrc -- if has
    self.inventoryitems = {}
    self.maxweight = maxweight
    self.playersOpened = {} -- sync the moves to other players who opened it

    self.addPlayer = function(source)
        self.playersOpened[source] = true
    end
    self.removePlayer = function(source)
        if self.playersOpened[source] then
            self.playersOpened[source] = nil
        end
    end
    self.syncToPlayers = function()
        if self.inventorytype ~= 'player' then
            for src, _ in pairs(self.playersOpened) do
                self.updateSecondInventory(src)
            end
        end
    end

    -- first creating all slots
    for i=1, slots, 1 do
        self.inventoryitems[i] = Config.Empty
    end

    local inventoryData = MySQL.Sync.fetchScalar('SELECT inventorydata FROM av_inventory WHERE owner = @owner AND type = @type', {
        ['@owner'] = self.owner,
        ['@type'] = self.inventorytype
    })
   
    if inventoryData then
        inventoryData = json.decode(inventoryData)
        -- then declare with the exist inventory data
        for i=1, #inventoryData, 1 do
            local d = inventoryData[i]
            local AV_ITEM = getDefinedItem(d.item)
            if self.inventoryitems[d.slot] ~= nil and AV_ITEM then
                self.inventoryitems[d.slot] = d
                self.inventoryitems[d.slot].itemdata = AV_ITEM
                self.inventoryitems[d.slot].slot = nil 
            end
        end
    else
        MySQL.Sync.insert('INSERT INTO av_inventory (owner, type) VALUES (@owner, @type)', {
            ['@owner'] = self.owner,
            ['@type'] = self.inventorytype
        })
        
        Citizen.CreateThread(function()
            while type(self.additem) == nil do
                Citizen.Wait(100)
            end

            if self.inventorytype == 'player' then
                for i=1, #Config.StartingItems, 1 do
                    self.addItem(Config.StartingItems[i].item, Config.StartingItems[i].quantity)
                end
            end
        end)
    end

    if self.inventorytype == 'player' and IsPlayerExist(self.playerSrc) then
        local name = string.format('%s (%s)', Config.GetPlayerName(self.playerSrc), self.playerSrc) 
        TriggerClientEvent('AquiverInventory:setPlayerStaticData', self.playerSrc, self.maxweight, name)
    end

    self.updatePlayerInventory = function()
        if self.inventorytype == 'player' and IsPlayerExist(self.playerSrc) then
            TriggerClientEvent('AquiverInventory:updatePlayerInventory', self.playerSrc, self.inventoryitems)
        end
    end

    self.updateSecondInventory = function(src)
        TriggerClientEvent('AquiverInventory:updateSecondInventory', src, self.inventoryitems, self.maxweight)
    end

    self.moveItemsInside = function(from, to, count, cb)
        local fromItem = json.decode(json.encode(self.inventoryitems[from]))
        local toItem = json.decode(json.encode(self.inventoryitems[to]))

        if not fromItem or not fromItem.quantity or not toItem then
            Config.DebugMsg('^5[AV_INVENTORY ERROR] ^1Item is not exist in the inventory. Event: self.moveItemsInside ^7')
            return
        end

        local AV_ITEM_FROM = getDefinedItem(fromItem.item)
        local AV_ITEM_TO = getDefinedItem(toItem.item)

        if (not AV_ITEM_FROM and fromItem ~= Config.Empty) or (not AV_ITEM_TO and toItem ~= Config.Empty) then
            Config.DebugMsg('^5[AV_INVENTORY ERROR] ^1Item is not exist in the system. (Define it in defineItem) ^7')
            return
        end

        if not count or count > fromItem.quantity then count = fromItem.quantity end

        if toItem.item == fromItem.item then -- if item is the same
            if count == fromItem.quantity then -- if he puts all
                self.inventoryitems[to].quantity = self.inventoryitems[to].quantity + count
                self.inventoryitems[from] = Config.Empty
                
                self.updatePlayerInventory()
                self.syncToPlayers()

                if cb then cb(true) end
                return true
            else -- if just some
                self.inventoryitems[to].quantity = self.inventoryitems[to].quantity + count
                self.inventoryitems[from].quantity = self.inventoryitems[from].quantity - count

                self.updatePlayerInventory()
                self.syncToPlayers()

                if cb then cb(true) end
                return true
            end
        elseif toItem ~= Config.Empty and fromItem ~= Config.Empty and toItem.item ~= fromItem.item then -- if slots not empty, but items are not the same
            self.inventoryitems[to] = fromItem
            self.inventoryitems[from] = toItem

            self.updatePlayerInventory()
            self.syncToPlayers()

            if cb then cb(true) end
            return true
        elseif toItem == Config.Empty then -- if to slot is empty
            if count == fromItem.quantity then
                self.inventoryitems[to] = fromItem
                self.inventoryitems[from] = Config.Empty

                self.updatePlayerInventory()
                self.syncToPlayers()               

                if cb then cb(true) end
                return true
            else
                self.inventoryitems[to] = fromItem
                self.inventoryitems[to].quantity = count
                self.inventoryitems[from].quantity = self.inventoryitems[from].quantity - count
            
                self.updatePlayerInventory()
                self.syncToPlayers()

                if cb then cb(true) end
                return true
            end
        end
    end

    self.save = function()
        Config.DebugMsg('^5[AV_INVENTORY] ^2Inventory savings started.. ^7')
        local saveitems = {}
        for i=1, #self.inventoryitems, 1 do
            if self.inventoryitems[i] ~= Config.Empty then
                table.insert(saveitems, {
                    item = self.inventoryitems[i].item,
                    quantity = self.inventoryitems[i].quantity,
                    vars = self.inventoryitems[i].vars,
                    slot = i
                })
            end
        end

        MySQL.Sync.execute('UPDATE av_inventory SET inventorydata = @inventorydata WHERE owner = @owner AND type = @type', {
            -- checkers
            ['@owner'] = self.owner,
            ['@type'] = self.inventorytype,
            
            -- setters
            ['@inventorydata'] = json.encode(saveitems)
        })
    end

    self.getItemCount = function(item)
        local count = 0
        for i=1, #self.inventoryitems, 1 do
            if self.inventoryitems[i].item == item then
                count = count + self.inventoryitems[i].quantity
            end
        end
        return count
    end

    self.isFreeSlotOrSameItem = function(slot, item)
        local AV_ITEM = getDefinedItem(item)
        if not AV_ITEM then return end
        
        local ok = false
        if self.inventoryitems[slot] == Config.Empty then
            ok = true
        elseif self.inventoryitems[slot].item == item and AV_ITEM.stackable then
            ok = true
        end

        return ok
    end

    self.getInventory = function()
        return self.inventoryitems
    end

    self.getInventoryWeight = function()
        local weight = 0.0
        for i=1, #self.inventoryitems, 1 do
            local value = self.inventoryitems[i]
            local AV_ITEM = getDefinedItem(value.item)
            if AV_ITEM then
                if AV_ITEM.stackable then
                    weight = weight + (AV_ITEM.weight * value.quantity)
                else
                    weight = weight + AV_ITEM.weight
                end
            end
        end

        return weight
    end

    self.searchForInventoryItem = function(item)
        for i=1, #self.inventoryitems, 1 do
            if self.inventoryitems[i].item == item then
                return self.inventoryitems[i]
            end
        end
    end

    self.availableSlot = function()
        if Config.IgnoreSlotsOnPickup then
            for i=6, #self.inventoryitems, 1 do
                if self.inventoryitems[i] == Config.Empty then
                    return i
                end
            end
        else
            for i=1, #self.inventoryitems, 1 do
                if self.inventoryitems[i] == Config.Empty then
                    return i
                end
            end
        end
    end

    self.addItemToSlot = function(slot, count, itemobj)
        if not self.inventoryitems[slot] then return end -- if not exist

        if self.inventoryitems[slot] == Config.Empty then -- if empty
            self.inventoryitems[slot] = itemobj
            self.inventoryitems[slot].quantity = count
        elseif self.inventoryitems[slot].item == itemobj.item then -- if not empty, but item is the same
            self.inventoryitems[slot].quantity = self.inventoryitems[slot].quantity + count
        end

        self.updatePlayerInventory()
        self.syncToPlayers()
    end

    self.removeItemAtSlot = function(slot, count, cb)
        if self.inventoryitems[slot] ~= Config.Empty then
            local item = self.inventoryitems[slot]

            item.quantity = item.quantity - count

            if item.quantity < 1 then
                self.inventoryitems[slot] = Config.Empty
            end

            self.syncToPlayers()
            self.updatePlayerInventory()
            
            if cb then cb(true) end
            return true
        end
    end

    self.removeItem = function(item, count, cb)
        local remaining = count
        local itemCount = self.getItemCount(item)
        if itemCount < 1 then
            if cb then cb(false) end
            return false
        end

        for i=1, #self.inventoryitems, 1 do
            if self.inventoryitems[i].item == item and remaining > 0 then
                if self.inventoryitems[i].quantity < remaining then
                    remaining = remaining - self.inventoryitems[i].quantity
                    self.inventoryitems[i] = Config.Empty
                elseif self.inventoryitems[i].quantity >= remaining then
                    self.inventoryitems[i].quantity = self.inventoryitems[i].quantity - remaining
                    if self.inventoryitems[i].quantity < 1 then
                        self.inventoryitems[i] = Config.Empty
                    end
                    remaining = 0
                end
            end
        end

        self.updatePlayerInventory()

        if remaining < 1 then
            if cb then cb(true) end
            return true
        end
    end

    self.addItem = function(item, count, vars, cb)
        local AV_ITEM = getDefinedItem(item)
        if not AV_ITEM then return end -- if not exist return instant
        if not AV_ITEM.stackable then count = 1 end -- if not stackable then set count to 1

        -- check the available space (weight)
        if self.maxweight < self.getInventoryWeight() + (AV_ITEM.weight * count) then
            if self.inventorytype == 'player' then
                Functions.SendNotification(self.playerSrc, _U('no_space_inventory'), 'error')
            end

            if cb then cb(false) end
            return
        end

        if AV_ITEM.stackable then
            local hasItem = self.searchForInventoryItem(item)
            if hasItem ~= Config.Empty and hasItem then
                hasItem.quantity = hasItem.quantity + count
                
                self.updatePlayerInventory()
                if self.inventorytype == 'player' and IsPlayerExist(self.playerSrc) then
                    TriggerClientEvent('AquiverInventory:itemNotification', self.playerSrc, item, AV_ITEM.formatname, count)
                end

                if cb then cb(true) end
                return true
            else
                local availableSlot = self.availableSlot()
                if availableSlot then
                    self.inventoryitems[availableSlot] = {
                        item = item,
                        quantity = count,
                        itemdata = AV_ITEM,
                        vars = vars
                    }

                    self.updatePlayerInventory()
                    if self.inventorytype == 'player' and IsPlayerExist(self.playerSrc) then
                        TriggerClientEvent('AquiverInventory:itemNotification', self.playerSrc, item, AV_ITEM.formatname, count)
                    end

                    if cb then cb(true) end
                    return true
                else
                    if self.inventorytype == 'player' then
                        Functions.SendNotification(self.playerSrc, _U('no_space_inventory_slot'), 'warning')
                    end

                    if cb then cb(false) end
                    return
                end
            end
        else
            local availableSlot = self.availableSlot()
            if availableSlot then
                self.inventoryitems[availableSlot] = {
                    item = item,
                    quantity = count,
                    itemdata = AV_ITEM,
                    vars = vars
                }
                self.updatePlayerInventory()
                if self.inventorytype == 'player' and IsPlayerExist(self.playerSrc) then
                    TriggerClientEvent('AquiverInventory:itemNotification', self.playerSrc, item, AV_ITEM.formatname, count)
                end

                if cb then cb(true) end
                return true
            else
                if self.inventorytype == 'player' then
                    Functions.SendNotification(self.playerSrc, _U('no_space_inventory_slot'), 'warning')
                end
          
                if cb then cb(false) end
                return
            end
        end
    end
    
    self.updatePlayerInventory()
    AquiverInventories[self.owner] = self
    return self
end

AddEventHandler('AquiverInventory:removeSecondary', function()
    local source = source
    if playerOpenedInventories[source] then
        local inve = playerOpenedInventories[source]
        if AquiverInventories[inve] then
            AquiverInventories[inve].removePlayer(source)
        end
        playerOpenedInventories[source] = nil
    end
end)

AddEventHandler('nui:AquiverInventory:moveToSecond', function(data)
    local source = source
    local index = data.index
    local droppedTo = data.droppedTo
    local count = data.count
    local inve = playerOpenedInventories[source]
    local identifier = Config.getIdentifier(source)

    if not inve then
        Config.DebugMsg('^5[AV_INVENTORY ERROR] ^1Error, secondary inventory not exist? Event: moveToSecond ^7')
        return
    end

    if AquiverInventories[identifier] and AquiverInventories[inve] then
        local playerInventory = AquiverInventories[identifier].getInventory()
        local secondInventory = AquiverInventories[inve].getInventory()

        if not playerInventory or not secondInventory or not playerInventory[index] or not secondInventory[droppedTo] then
            Config.DebugMsg('^5[AV_INVENTORY ERROR] ^1Error, items are not exist in player or secondary inventory. Event: moveToSecond ^7')
            return
        end

        if not playerInventory[index].itemdata.tradable then
            return Functions.SendNotification(source, _U('item_not_tradable'), 'error')
        end

        local playeritem = json.decode(json.encode(playerInventory[index]))
        local seconditem = json.decode(json.encode(secondInventory[droppedTo]))

        if not playeritem or not seconditem then return end
        if playeritem == Config.Empty then return end
        if not count or count > playeritem.quantity then count = playeritem.quantity end

        local AV_ITEM = getDefinedItem(playeritem.item)
        if not AV_ITEM then return end

        if AquiverInventories[inve].maxweight > AquiverInventories[inve].getInventoryWeight() + (AV_ITEM.weight * count) then
            if AquiverInventories[inve].isFreeSlotOrSameItem(droppedTo, playeritem.item) then
                local removeSuccess = AquiverInventories[identifier].removeItemAtSlot(index, count)
                if removeSuccess then
                    AquiverInventories[inve].addItemToSlot(droppedTo, count, playeritem)
                end
            end
        else
            Functions.SendNotification(source, _U('no_space_inventory'), 'warning')
        end
    end
end)

AddEventHandler('nui:AquiverInventory:moveToFirst', function(data)
    local source = source

    local index = data.index
    local droppedTo = data.droppedTo
    local count = data.count
    local inve = playerOpenedInventories[source]
    local identifier = Config.getIdentifier(source)

    if not inve then
        Config.DebugMsg('^5[AV_INVENTORY ERROR] ^1 Error, secondary inventory not exist? Event: moveToFirst ^7')
        return
    end

    if AquiverInventories[identifier] and AquiverInventories[inve] then
        local playerInventory = AquiverInventories[identifier].getInventory()
        local secondInventory = AquiverInventories[inve].getInventory()

        if not playerInventory or not secondInventory or not playerInventory[droppedTo] or not secondInventory[index] then
            Config.DebugMsg('^5[AV_INVENTORY ERROR] ^1 Error, items are not exist in player or secondary inventory. Event: moveToFirst ^7')
            return
        end

        if playerInventory and secondInventory then
            local playeritem = json.decode(json.encode(playerInventory[droppedTo]))
            local seconditem = json.decode(json.encode(secondInventory[index]))

            if seconditem == Config.Empty then return end
            if not count or count > seconditem.quantity then count = seconditem.quantity end

            local AV_ITEM = getDefinedItem(seconditem.item)
            if not AV_ITEM then return end

            if AquiverInventories[identifier].maxweight > AquiverInventories[identifier].getInventoryWeight() + (AV_ITEM.weight * count) then
                if AquiverInventories[identifier].isFreeSlotOrSameItem(droppedTo, seconditem.item) then
                    local removeSuccess = AquiverInventories[inve].removeItemAtSlot(index, count)
                    if removeSuccess then
                        AquiverInventories[identifier].addItemToSlot(droppedTo, count, seconditem)
                    end
                end
            else
                Functions.SendNotification(source, _U('no_space_inventory'), 'warning')
            end
        end
    else
        Config.DebugMsg('^5[AV_INVENTORY ERROR] ^1 Error, one of the inventory is not exist. Event: moveToFirst ^7')
    end
end)

AddEventHandler('nui:AquiverInventory:instantToMain', function(index)
    local source = source
    local index = tonumber(index)
    local identifier = Config.getIdentifier(source)
    local inve = playerOpenedInventories[source]

    if not inve then
        Config.DebugMsg('^5[AV_INVENTORY ERROR] ^1 Error, secondary inventory not exist? Event: instantToMain ^7')
        return
    end

    if AquiverInventories[identifier] and AquiverInventories[inve] then
        local playerInventory = AquiverInventories[identifier].getInventory()
        local secondInventory = AquiverInventories[inve].getInventory()

        if not secondInventory[index] or secondInventory[index] == Config.Empty then return end

        local seconditem = json.decode(json.encode(secondInventory[index]))

        local success = AquiverInventories[identifier].addItem(seconditem.item, seconditem.quantity, seconditem.vars)
        if success then
            secondInventory[index] = Config.Empty
            AquiverInventories[inve].syncToPlayers()
        end
    end
end)

AddEventHandler('nui:AquiverInventory:instantToSecond', function(index)
    local source = source
    local index = tonumber(index)
    local identifier = Config.getIdentifier(source)
    local inve = playerOpenedInventories[source]

    if not inve then
        Config.DebugMsg('^5[AV_INVENTORY ERROR] ^1 Error, secondary inventory not exist? Event: instantToSecond ^7')
    end

    if AquiverInventories[identifier] and AquiverInventories[inve] then
        local playerInventory = AquiverInventories[identifier].getInventory()
        local secondInventory = AquiverInventories[inve].getInventory()

        if not playerInventory[index] or playerInventory[index] == Config.Empty then return end

        if not playerInventory[index].itemdata.tradable then
            return Functions.SendNotification(source, _U('item_not_tradable'), 'error')
        end

        local playeritem = json.decode(json.encode(playerInventory[index]))

        local success = AquiverInventories[inve].addItem(playeritem.item, playeritem.quantity, playeritem.vars)
        if success then
            playerInventory[index] = Config.Empty
            AquiverInventories[identifier].updatePlayerInventory()
            AquiverInventories[inve].syncToPlayers()
        end
    end
end)

AddEventHandler('nui:AquiverInventory:giveItemToTarget', function(data)
    local count = tonumber(data.count)
    local index = tonumber(data.index)
    local targetSrc = tonumber(data.targetSrc)

    local source = source
    local playerIdentifier = Config.getIdentifier(source)
    local targetIdentifier = Config.getIdentifier(targetSrc)

    if AquiverInventories[playerIdentifier] and AquiverInventories[targetIdentifier] then
        local playerInventory = AquiverInventories[playerIdentifier].getInventory()
        local targetInventory = AquiverInventories[targetIdentifier].getInventory()

        if playerInventory and targetInventory then
            local item = playerInventory[index]
            if item and item.quantity >= count then
                local success = AquiverInventories[targetIdentifier].addItem(item.item, count, item.vars)
                if success then
                    AquiverInventories[playerIdentifier].removeItemAtSlot(index, count)
                end
            end
        end
    end
end)

AddEventHandler('nui:AquiverInventory:useItem', function(index)
    local source = source
    local identifier = Config.getIdentifier(source)

    if AquiverInventories[identifier] then
        local playerInventory = AquiverInventories[identifier].getInventory()
        
        if playerInventory and playerInventory[index] then
            useItem(source, playerInventory[index].item, index)
        end
    end
end)

AddEventHandler('nui:AquiverInventory:moveInside', function(data)
    local source = source
    local identifier = Config.getIdentifier(source)
    if data.inventoryType == 'main' then
        if AquiverInventories[identifier] then
           AquiverInventories[identifier].moveItemsInside(data.index, data.droppedTo, data.count)
        end
    elseif data.inventoryType == 'second' then
        if playerOpenedInventories[source] then
            local inve = playerOpenedInventories[source]
            if AquiverInventories[inve] then
                AquiverInventories[inve].moveItemsInside(data.index, data.droppedTo, data.count)
            end
        end
    end
end)

AddEventHandler('playerJoining', function()
    loadPlayerInventory(tonumber(source))
end)

AddEventHandler('playerDropped', function()
    local identifier = Config.getIdentifier(source)
    if AquiverInventories[identifier] then
        AquiverInventories[identifier].save()
        AquiverInventories[identifier] = nil
    end

    if playerOpenedInventories[source] then
        playerOpenedInventories[source] = nil
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        Citizen.Wait(250)
        local players = GetPlayers()

        for _, src in pairs(players) do
            loadPlayerInventory(tonumber(src))
        end
    end
end)

AddEventHandler('AquiverInventory:openSecondInventory', function(data)
    local source = source

    if data.type == 'faction' then
        local rev = 'factionsafe-' .. data.faction
        if data.faction == Config.getPlayerFaction(source) then
            if AquiverInventories[rev] then
                playerOpenedInventories[source] = rev
                AquiverInventories[rev].addPlayer(source)
                AquiverInventories[rev].updateSecondInventory(source)
            else
                local inventory = createInventory('factionsafe', rev, nil, Config.DefaultSlots['factionsafe'], Config.DefaultWeights['factionsafe'])
                playerOpenedInventories[source] = rev
                inventory.addPlayer(source)
                inventory.updateSecondInventory(source)
            end
        end
    elseif data.type == 'cartrunk' then
        local rev = 'cartrunk-' .. data.plate
        local maxweightsveh = getVehicleWeights(data.vehiclemodel)
        local maxwg = Config.DefaultWeights['cartrunk']
        if maxweightsveh then
            maxwg = maxweightsveh.trunk
        end
        if AquiverInventories[rev] then
            playerOpenedInventories[source] = rev
            AquiverInventories[rev].addPlayer(source)
            AquiverInventories[rev].updateSecondInventory(source)
        else
            local vehicleExist = Config.vehicleExistDatabase(data.plate)
            if vehicleExist then
                local inventory = createInventory('cartrunk', rev, nil, Config.DefaultSlots['cartrunk'], maxwg)
                playerOpenedInventories[source] = rev
                inventory.addPlayer(source)
                inventory.updateSecondInventory(source)
            end
        end
    elseif data.type == 'carglovebox' then
        local rev = 'carglovebox-' .. data.plate
        local maxweightsveh = getVehicleWeights(data.vehiclemodel)
        local maxwg = Config.DefaultWeights['carglovebox']
        if maxweightsveh then
            maxwg = maxweightsveh.glovebox
        end
        if AquiverInventories[rev] then
            playerOpenedInventories[source] = rev
            AquiverInventories[rev].addPlayer(source)
            AquiverInventories[rev].updateSecondInventory(source)
        else
            local vehicleExist = Config.vehicleExistDatabase(data.plate)
            if vehicleExist then
                local inventory = createInventory('carglovebox', rev, nil, Config.DefaultSlots['carglovebox'], maxwg)
                playerOpenedInventories[source] = rev
                inventory.addPlayer(source)
                inventory.updateSecondInventory(source)
            end
        end
    elseif data.type == 'other' then
        local rev = Config.OtherInventories[data.id].assign(source)
        if rev then
            if AquiverInventories[rev] then
                playerOpenedInventories[source] = rev
                AquiverInventories[rev].addPlayer(source)
                AquiverInventories[rev].updateSecondInventory(source)
            else
                local inventory = createInventory('other', rev, nil,
                Config.OtherInventories[data.id].slots,
                Config.OtherInventories[data.id].weight)

                playerOpenedInventories[source] = rev
                inventory.addPlayer(source)
                inventory.updateSecondInventory(source)
            end
        end
    end
end)

function loadPlayerInventory(source)
    local identifier = Config.getIdentifier(source)
    local inventory = createInventory('player', identifier, source, Config.DefaultSlots['player'], Config.DefaultWeights['player'])
end

function IsPlayerExist(source)
    if GetPlayerName(source) == nil then
        return false
    else
        return true
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.SaveFreq)

        for k, v in pairs(AquiverInventories) do
            AquiverInventories[k].save()
        end
    end
end)

AddEventHandler('baseevents:onPlayerDied', function(killedBy, pos)
    local source = source

    if Config.DeleteItemsDeath then
        local identifier = Config.getIdentifier(source)
        if AquiverInventories[identifier] then
            local playerInventory = AquiverInventories[identifier].getInventory()
            for i=1, #playerInventory, 1 do
                if playerInventory[i] ~= Config.Empty then
                    if playerInventory[i].itemdata and playerInventory[i].itemdata.candelete then
                        playerInventory[i] = Config.Empty
                    end
                end
            end
            AquiverInventories[identifier].updatePlayerInventory()
        end
    end
end)

RegisterCommand('giveitem', function(source, args)
    if Config.isPlayerAdmin(source) then
        local target = tonumber(args[1])
        local item = args[2]
        local count = tonumber(args[3])

        if target and item and count then
            local targetIdentifier = Config.getIdentifier(target)
            if targetIdentifier and AquiverInventories[targetIdentifier] then
                local success = AquiverInventories[targetIdentifier].addItem(item, count)
                if success then
                    Functions.SendNotification(source, _('itemgived_msg', item, GetPlayerName(target), target, count), 'success')
                else 
                    Functions.SendNotification(source, _U('itemgive_fail'), 'error')
                end
            end
        end
    end
end)