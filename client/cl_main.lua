local clonedPed = nil

inventoryOpened = false
NUI_LOADED = false
inventoryData = nil

RegisterNUICallback('nui:AquiverInventory:mounted', function()
    NUI_LOADED = true
end)

-- MAIN OPENING THREAD
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsDisabledControlJustPressed(0, 318) then
            SendNUIMessage({action = 'openInventory', isMale = IsPedMale(PlayerPedId()) })

            local playerpos = GetEntityCoords(PlayerPedId())
            local playerinvehicle = IsPedInAnyVehicle(PlayerPedId(), false)

            if playerinvehicle then -- if player is in the vehicle, open glovebox, eg.
                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                if DoesEntityExist(veh) then
                    local seat_driver = GetPedInVehicleSeat(veh, -1)
                    local seat_second = GetPedInVehicleSeat(veh, 0)
                    
                    if seat_driver or seat_second then
                        local plate = Functions.Trim(GetVehicleNumberPlateText(veh))
                        TriggerServerEvent('AquiverInventory:openSecondInventory', {
                            type = 'carglovebox',
                            plate = plate
                        })
                    end
                end
            else
                local foundAny = false

                for i=1, #Config.FactionSafes, 1 do
                    local d = Config.FactionSafes[i]
                    local dist = #(playerpos - d.pos)
                    if dist < 3.5 then
                        foundAny = true
                        TriggerServerEvent('AquiverInventory:openSecondInventory', {
                            type = 'faction',
                            faction = d.faction
                        })
                    end
                end

                if not foundAny then
                    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)
                    local rayHandle = CastRayPointToPoint(playerpos, entityWorld, 10, PlayerPedId(), 0)
                    local a, b, c, d, veh = GetRaycastResult(rayHandle)

                    if veh ~= nil and DoesEntityExist(veh) and IsEntityAVehicle(veh) then
                        local vehpos = GetEntityCoords(veh)
                        local boneIndex = GetEntityBoneIndexByName(veh, 'boot')
                        local bootCoords = nil

                        if boneIndex ~= -1 then
                            bootCoords = GetWorldPositionOfEntityBone(veh, boneIndex)
                        end
                        
                        if bootCoords ~= nil then
                            local offset = GetObjectOffsetFromCoords(bootCoords.x, bootCoords.y, bootCoords.z, GetEntityHeading(veh), 0.0, -1.0, 0.0)
                            local dist = #(playerpos - offset)
                            if dist < 2.0 then
                                local plate = Functions.Trim(GetVehicleNumberPlateText(veh))
                                local lockStatus = GetVehicleDoorLockStatus(veh)
                                if lockStatus == 1 then
                                    foundAny = true
                                    TriggerServerEvent('AquiverInventory:openSecondInventory', {
                                        type = 'cartrunk',
                                        plate = plate,
                                        vehiclemodel = GetEntityModel(veh)
                                    })
                                    SetVehicleDoorOpen(veh, 5, false)
                                    selectedTrunkOpened = veh

                                    local dict, anim = 'mini@repair', 'fixing_a_ped'
                                    RequestAnimDict(dict)
                                    while not HasAnimDictLoaded(dict) do
                                        Citizen.Wait(1)
                                    end
                                    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
                                else
                                    Functions.SendNotification(_U('veh_closed'), 'info')
                                end
                            end
                        else
                            if #(playerpos - vehpos) < 5.0 then
                                local plate = Functions.Trim(GetVehicleNumberPlateText(veh))
                                local lockStatus = GetVehicleDoorLockStatus(veh)
                                if lockStatus == 1 then
                                    foundAny = true
                                    TriggerServerEvent('AquiverInventory:openSecondInventory', {
                                        type = 'cartrunk',
                                        plate = plate,
                                        vehiclemodel = GetEntityModel(veh)
                                    })
                                    SetVehicleDoorOpen(veh, 5, false)
                                    selectedTrunkOpened = veh
                                else
                                    Functions.SendNotification(_U('veh_closed'), 'info')
                                end
                            end
                        end
                    end
                end

                if not foundAny then
                    for i=1, #Config.OtherInventories, 1 do
                        local d = Config.OtherInventories[i]
                        if #(playerpos - d.pos) < 3.0 then
                            foundAny = true
                            TriggerServerEvent('AquiverInventory:openSecondInventory', {
                                type = 'other',
                                id = i
                            })
                        end
                    end
                end
            end
        end
    end
end)

--RegisterCommand('car', function()
--    CreateVehicle(GetHashKey('sultanrs'), GetEntityCoords(PlayerPedId()), 0.0, true, false)
--end)

RegisterNUICallback('nui:AquiverInventory:blurState', function(blur)
    if blur == 'on' then
        TriggerScreenblurFadeIn()
    elseif blur == 'off' then
        TriggerScreenblurFadeOut()
    end
end)

RegisterNUICallback('nui:AquiverInventory:openedState', function(data)
    local state = data.state
    local blur = data.blur
    
    inventoryOpened = state

    -- global
    SetNuiFocus(state, state)
    DisplayRadar(not state)
    TriggerEvent('AquiverHud:DisableHud', state)

    if state then
        if blur == 'on' then TriggerScreenblurFadeIn() end
    else
        if selectedTrunkOpened and DoesEntityExist(selectedTrunkOpened) then
            
            if NetworkGetEntityIsNetworked(selectedTrunkOpened) then
                NetworkRequestControlOfNetworkId(NetworkGetNetworkIdFromEntity(selectedTrunkOpened))
                while DoesEntityExist(selectedTrunkOpened) and
                    NetworkGetEntityOwner(selectedTrunkOpened) ~= PlayerId() and
                    DoesEntityExist(selectedTrunkOpened) do
                    Citizen.Wait(1)
                end
            end

            SetVehicleDoorShut(selectedTrunkOpened, 5, false)
            selectedTrunkOpened = nil
            ClearPedTasksImmediately(PlayerPedId())
        end

        TriggerServerEvent('AquiverInventory:removeSecondary')
        TriggerScreenblurFadeOut()
    end
end)

RegisterNetEvent('AquiverInventory:updateSecondInventory')
AddEventHandler('AquiverInventory:updateSecondInventory', function(inventory, maxweight)
    while not NUI_LOADED do
        Citizen.Wait(100)
    end
    SendNUIMessage({
        action = 'updateSecondInventory',
        inventory = inventory,
        maxweight = maxweight
    })
end)

RegisterNetEvent('AquiverInventory:updatePlayerInventory')
AddEventHandler('AquiverInventory:updatePlayerInventory', function(inventory)
    while not NUI_LOADED do
        Citizen.Wait(100)
    end
    SendNUIMessage({
        action = 'updatePlayerInventory',
        inventory = inventory
    })
    inventoryData = inventory
end)

RegisterNetEvent('AquiverInventory:setPlayerStaticData')
AddEventHandler('AquiverInventory:setPlayerStaticData', function(maxweight, name)
    while not NUI_LOADED do
        Citizen.Wait(100)
    end
    SendNUIMessage({ action = 'setPlayerStaticData', maxweight = maxweight, name = name})
end)

RegisterNUICallback('nui:AquiverInventory:moveInside', function(data)
    TriggerServerEvent('nui:AquiverInventory:moveInside', data)
end)
RegisterNUICallback('nui:AquiverInventory:moveToFirst', function(data)
    TriggerServerEvent('nui:AquiverInventory:moveToFirst', data)
end)
RegisterNUICallback('nui:AquiverInventory:moveToSecond', function(data)
    TriggerServerEvent('nui:AquiverInventory:moveToSecond', data)
end)
RegisterNUICallback('nui:AquiverInventory:instantToSecond', function(index)
    TriggerServerEvent('nui:AquiverInventory:instantToSecond', index)
end)
RegisterNUICallback('nui:AquiverInventory:instantToMain', function(index)
    TriggerServerEvent('nui:AquiverInventory:instantToMain', index)
end)
RegisterNUICallback('nui:AquiverInventory:useItem', function(index)
    TriggerServerEvent('nui:AquiverInventory:useItem', index)
end)
RegisterNUICallback('nui:AquiverInventory:giveItemToTarget', function(data)
    local targetSrc = tonumber(data.targetSrc)
    local targetHandle = GetPlayerPed(GetPlayerFromServerId(targetSrc))
    local playerpos = GetEntityCoords(PlayerPedId())
    if targetHandle and #(playerpos - GetEntityCoords(targetHandle)) < 5.0 then
        TriggerServerEvent('nui:AquiverInventory:giveItemToTarget', data)
    else
        Functions.SendNotification(_U('target_notnear'), 'warning')
    end
end)

-- Create Ped

Citizen.CreateThread(function()
    while true do
        if isInInventory then 
            Citizen.Wait(0)
            SetMouseCursorVisibleInMenus(false)
        else 
            Citizen.Wait(1000)
        end 
    end
end)

function CreatePedScreen(first)
    CreateThread(function()
        local heading = GetEntityHeading(PlayerPedId())
        SetFrontendActive(true)
        ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_JOINING_SCREEN"), true, -1)
        Wait(100)
        SetMouseCursorVisibleInMenus(false)
        PlayerPedPreview = ClonePed(PlayerPedId(), heading, true, false)
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedPreview))
        SetEntityCoords(PlayerPedPreview, x, y, z - 10)
        FreezeEntityPosition(PlayerPedPreview, true)
        SetEntityVisible(PlayerPedPreview, false, false)
        NetworkSetEntityInvisibleToNetwork(PlayerPedPreview, false)
        Wait(200)
        SetPedAsNoLongerNeeded(PlayerPedPreview)
        GivePedToPauseMenu(PlayerPedPreview, 2)
        SetPauseMenuPedLighting(true)
        if first then
            SetPauseMenuPedSleepState(false)
            Wait(1000)
            SetPauseMenuPedSleepState(true)
        else
            SetPauseMenuPedSleepState(true)
        end
    end)
end

function DeletePedScreen()
    DeleteEntity(PlayerPedPreview)
    SetFrontendActive(false)
end

function RefreshPedScreen()
    if DoesEntityExist(PlayerPedPreview) then
        DeletePedScreen()
        Wait(500)
        if isInInventory then
            CreatePedScreen(false)
        end
    end
end

function openInventory()
    LoadPlayerInventory(currentMenu)
    ActiveHud()
    CreatePedScreen(true)
    isInInventory = true
    open = true
    SendNUIMessage({action = "display", type = "normal"})
    SetNuiFocus(true, true)
    SetKeepInputMode(true)
    disablecontrol = true
    TriggerScreenblurFadeIn(0)
    DisplayRadar(false)
end

-- SECONDARY INVENTORIES RENDER
Citizen.CreateThread(
    function()
        local modelhash = GetHashKey('p_v_43_safe_s')
        RequestModel(modelhash)
        while not HasModelLoaded(modelhash) do
            Citizen.Wait(10)
        end
        for i=1, #Config.FactionSafes, 1 do
            local obj = CreateObject(modelhash, Config.FactionSafes[i].pos, false, false, false)
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)
            SetEntityHeading(obj, Config.FactionSafes[i].heading)
        end
        SetModelAsNoLongerNeeded(modelhash)

        while true do
            local letSleep = true
            Citizen.Wait(0)

            local playerpos = GetEntityCoords(PlayerPedId())

            for i=1, #Config.OtherInventories, 1 do
                local d = Config.OtherInventories[i]
                local dist = #(playerpos - d.pos)
                if dist < 15 then
                    letSleep = false
                    DrawMarker(1, d.pos + vector3(0.0, 0.0, 0.8), 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.8, 0.8, 0.8, 20, 20, 20,
                    85, false, true, 2, false, nil, nil, false)
                end
            end

            if letSleep then
                Citizen.Wait(1000)
            end
        end
    end
)

RegisterNUICallback('getNearbyPlayers', function(_, cb)
    local players = GetActivePlayers()
    local tbl = {}
    local playerpos = GetEntityCoords(PlayerPedId())
    for i=1, #players, 1 do
        if players[i] ~= PlayerId() then
            local dist = #(playerpos - GetEntityCoords(GetPlayerPed(players[i])))
            if dist < 5.0 then
                table.insert(tbl, GetPlayerServerId(players[i]))
            end
        end
    end
    if #tbl > 0 then
        cb(tbl)
    else
        Functions.SendNotification(_U('no_player_nearby'), 'info')
    end
end)

RegisterNetEvent('AquiverInventory:itemNotification')
AddEventHandler('AquiverInventory:itemNotification', function(name, formatname, count)
    SendNUIMessage({action = 'itemNotification', name = name, formatname = formatname, count = count})
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if inventoryData then
            if IsDisabledControlJustPressed(0, 157) then -- 1
                if inventoryData[1] ~= 'empty' then
                    SendNUIMessage({action = 'slotNotification', name = inventoryData[1].item, formatname = inventoryData[1].itemdata.formatname })
                    TriggerServerEvent('nui:AquiverInventory:useItem', 1)
                end
            elseif IsDisabledControlJustPressed(0, 158) then -- 2
                if inventoryData[2] ~= 'empty' then
                    SendNUIMessage({action = 'slotNotification', name = inventoryData[2].item, formatname = inventoryData[2].itemdata.formatname })
                    TriggerServerEvent('nui:AquiverInventory:useItem', 2)
                end
            elseif IsDisabledControlJustPressed(0, 160) then -- 3
                if inventoryData[3] ~= 'empty' then
                    SendNUIMessage({action = 'slotNotification', name = inventoryData[3].item, formatname = inventoryData[3].itemdata.formatname })
                    TriggerServerEvent('nui:AquiverInventory:useItem', 3)
                end
            elseif IsDisabledControlJustPressed(0, 164) then -- 4
                if inventoryData[4] ~= 'empty' then
                    SendNUIMessage({action = 'slotNotification', name = inventoryData[4].item, formatname = inventoryData[4].itemdata.formatname })
                    TriggerServerEvent('nui:AquiverInventory:useItem', 4)
                end
            elseif IsDisabledControlJustPressed(0, 165) then --5
                if inventoryData[5] ~= 'empty' then
                    SendNUIMessage({action = 'slotNotification', name = inventoryData[5].item, formatname = inventoryData[5].itemdata.formatname })
                    TriggerServerEvent('nui:AquiverInventory:useItem', 5)
                end
            end
        end
    end
end)