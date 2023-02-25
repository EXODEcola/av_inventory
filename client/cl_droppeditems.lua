local droppedItems = {}

RegisterNetEvent('AquiverInventory:spawnDroppedItems')
RegisterNetEvent('AquiverInventory:removeDroppedItem')
RegisterNetEvent('AquiverInventory:addDroppedItem')

RegisterNUICallback('nui:AquiverInventory:throwItem', function(data)
    local playerpos = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('nui:AquiverInventory:throwItem', data, playerpos)
end)

AddEventHandler('AquiverInventory:spawnDroppedItems', function(alldrops)
    droppedItems = alldrops

    for k,v in pairs(droppedItems) do
        local item = v.item

        if item.itemdata and item.itemdata.model then
            local model = GetHashKey(item.itemdata.model)
            if IsModelValid(model) and IsModelInCdimage(model) then
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Citizen.Wait(1)
                end

                droppedItems[k].objecthandle = CreateObject(model, v.pos, false, false, true)
                while not HasCollisionForModelLoaded(model) do
                    Citizen.Wait(1)
                end
                ActivatePhysics(droppedItems[k].objecthandle)
                FreezeEntityPosition(droppedItems[k].objecthandle, false)

                SetModelAsNoLongerNeeded(model)
            end
        end
    end
end)

AddEventHandler('AquiverInventory:removeDroppedItem', function(id)
    if droppedItems[id] then
        if DoesEntityExist(droppedItems[id].objecthandle) then
            DeleteObject(droppedItems[id].objecthandle)
        end

        droppedItems[id] = nil
    end
end)

AddEventHandler('AquiverInventory:addDroppedItem', function(id, data)
    droppedItems[id] = data

    local item = data.item

    if item.itemdata and item.itemdata.model then
        local model = GetHashKey(item.itemdata.model)
        if IsModelValid(model) and IsModelInCdimage(model) then
            RequestModel(model)
            while not HasModelLoaded(model) do
                Citizen.Wait(1)
            end

            droppedItems[id].objecthandle = CreateObject(model, data.pos, false, false, true)
            while not HasCollisionForModelLoaded(model) do
                Citizen.Wait(1)
            end
            ActivatePhysics(droppedItems[id].objecthandle)
            FreezeEntityPosition(droppedItems[id].objecthandle, false)

            SetModelAsNoLongerNeeded(model)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local letSleep = true

        local playerpos = GetEntityCoords(PlayerPedId())

        for k,v in pairs(droppedItems) do
            if DoesEntityExist(v.objecthandle) then
                local objcoords = GetEntityCoords(v.objecthandle)
                local dist = #(playerpos - objcoords)
                if dist < 5.0 then
                    letSleep = false
                    if v.item.itemdata.stackable and v.item.quantity > 0 then
                        if dist < 1.5 then
                            Functions.DrawText3D(objcoords, string.format('~g~%s [%s]', v.item.itemdata.formatname, v.item.quantity))
                            if IsDisabledControlJustPressed(0, 38) then
                                local dict, anim = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@', 'plant_floor'
                                while not HasAnimDictLoaded(dict) do
                                    Citizen.Wait(0)
                                end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 1.0, 1000, 33, 0.0, false, false, false)
                                Citizen.Wait(1000)
                                PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
                                TriggerServerEvent('AquiverInventory:pickupItem', k)
                                break
                            end
                        else
                            Functions.DrawText3D(objcoords, string.format('%s [%s]', v.item.itemdata.formatname, v.item.quantity))
                        end
                    else
                        if dist < 1.5 then
                            Functions.DrawText3D(objcoords, string.format('~g~%s', v.item.itemdata.formatname))
                            if IsDisabledControlJustPressed(0, 38) then
                                local dict, anim = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@', 'plant_floor'
                                while not HasAnimDictLoaded(dict) do
                                    Citizen.Wait(0)
                                end
                                TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 1.0, 1000, 33, 0.0, false, false, false)
                                Citizen.Wait(1000)
                                PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
                                TriggerServerEvent('AquiverInventory:pickupItem', k)
                                break
                            end
                        else
                            Functions.DrawText3D(objcoords, string.format('%s', v.item.itemdata.formatname))
                        end
                    end
                end
            end
        end

        if letSleep then
            Citizen.Wait(1000)
        end
        Citizen.Wait(0)
    end
end)