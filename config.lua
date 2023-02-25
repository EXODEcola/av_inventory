Functions = {}
Config = {}
Config.Locale = 'en'
Config.Debug = true

Config.DebugMsg = function(msg)
    if Config.Debug then print(msg) end
end

Config.FactionSafes = {
    { faction = 'police', pos = vector3(321.2, 168.7, 102.6), heading = 20.0 },
    { faction = 'medic', pos = vector3(330.2, 168.3, 102.6), heading = 60.0 },
}

Config.OtherInventories = {
    {
        pos = vector3(216.6, -817.6, 29.58),
        weight = 80,
        slots = 40,
        assign = function(source) -- THIS IS NOT SHARED! Only opening for the player, because we used with identifier
            return 'motel-' .. Config.getIdentifier(source)
        end
    }
    -- { -- THIS IS SHARED! EXAMPLE WITH HOUSING! You need to have a server function to get which house the player is in.
    --     pos = vector3(0.0, 0.0, 0.0),
    --     weight = 1000,
    --     assign = function(source)
    --         return 'house-' .. getplayerhouseId()
    --     end
    -- }
}

Functions.Trim = function(value)
    if value then
        return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
    else
        return nil
    end
end

Config.Weapons = {
    ['WEAPON_PISTOL'] = '9mm_rounds',
    ['WEAPON_PISTOL50'] = '556_rounds',
    ['WEAPON_STUNGUN'] = {},
    ['WEAPON_KNIFE'] = {}
}

if IsDuplicityVersion() then -- serverside
    Config.Empty = 'empty' -- DO NOT MODIFY IN ANY CASE
    Config.SaveFreq = 60000 * 5 -- how often save every inventory
    Config.DeleteItemsDeath = true -- delete tradable items on death or not
    Config.StartingItems = {
        { item = 'bread', quantity = 5 },
        { item = 'water', quantity = 5 },
        { item = 'money', quantity = 1000 }
    }
    Config.DefaultSlots = { -- amount of itemslots inside the inventory type
        ['player'] = 60,
        ['cartrunk'] = 60,
        ['carglovebox'] = 10,
        ['factionsafe'] = 120
    }
    Config.DefaultWeights = {
        ['player'] = 80,
        ['cartrunk'] = 1000, -- if not exist in the config_weights.lua this is the default
        ['carglovebox'] = 100, -- if not exist in the config_weights.lua this is the default
        ['factionsafe'] = 10000
    }
    Config.IgnoreSlotsOnPickup = false -- do not add items to slots when we pickup an item (1-5), so it will be added to our 6. slot

    Config.vehicleExistDatabase = function(plate)
        -- here implement your mysql check that the vehicle is exist or not.
        -- example

        -- local exist = MySQL.Sync.fetchScalar('SELECT COUNT(1) FROM av_vehicles WHERE plate = @plate', {
        --     ['@plate'] = plate
        -- })
        -- if exist and exist > 0 then
        --     return true
        -- end
        -- return false

        return true
    end

    Config.isPlayerAdmin = function(source) -- ADD YOUR ADMIN SYSTEM HERE!
        return true
    end

    Config.getPlayerFaction = function(source) -- ADD YOUR FACTION SYSTEM HERE
        return 'police'
    end

    Config.GetPlayerName = function(source) -- ADD YOUR ROLEPLAY NAME GETTER HERE
        return GetPlayerName(source)
    end

    Config.getIdentifier = function(source)
        local id = nil
        for k, v in pairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, string.len('license:')) == 'license:' then
                id = v
            end
        end

        return id
    end

    Functions.SendNotification = function(source, msg, type) -- EDIT IT TO YOUR NOTIFICATION
        TriggerClientEvent('av:Notify', source, type, msg)
    end
else -- clientside
    Functions.SendNotification = function(msg, type) -- EDIT IT TO YOUR NOTIFICATION
        TriggerEvent('av:Notify', type, msg)
    end
    Functions.DrawText3D = function(coords, text, size, font)
        coords = vector3(coords.x, coords.y, coords.z)

        local camCoords = GetGameplayCamCoords()
        local distance = #(coords - camCoords)

        size = size or 1
        font = font or 0

        local scale = (size / distance) * 2
        local fov = (1 / GetGameplayCamFov()) * 100
        scale = scale * fov

        SetTextScale(0.0 * scale, 0.55 * scale)
        SetTextFont(font)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextCentre(true)

        SetDrawOrigin(coords, 0)
        BeginTextCommandDisplayText('STRING')
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandDisplayText(0.0, 0.0)
        ClearDrawOrigin()
    end
end
