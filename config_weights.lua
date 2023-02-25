VehicleWeights = {
    ['blade'] = { trunk = 350, glovebox = 50 },
    ['buccaneer'] = { trunk = 300, glovebox = 65 }
}

function getVehicleWeights(vehicle) -- vehicle model or hash
    for k,v in pairs(VehicleWeights) do
        if k == vehicle or GetHashKey(k) == vehicle then
            return v
        end
    end
    return nil
end