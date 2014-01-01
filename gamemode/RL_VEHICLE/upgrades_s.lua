function getVehicleHandlingProperty ( element, property )
    if isElement ( element ) and getElementType ( element ) == "vehicle" and type ( property ) == "string" then -- Make sure there's a valid vehicle and a property string
        local handlingTable = getVehicleHandling ( element ) -- Get the handling as table and save as handlingTable
        local value = handlingTable[property] -- Get the value from the table
 
        if value then -- If there's a value (valid property)
            return value -- Return it
        end
    end
 
    return false -- Not an element, not a vehicle or no valid property string. Return failure
end


addCommandHandler("ua",function (ps)
    if isPedInVehicle(ps) then
        local vehicle = getPedOccupiedVehicle(ps)
        local acceleration = getVehicleHandlingProperty(vehicle,"engineAcceleration")
        setVehicleHandling(vehicle,"engineAcceleration",tonumber(acceleration)+1)
        outputChatBox("#63DBFF*Ulepszyłeś akceleracje pojazdu.",ps,0,0,0,true)
        else
        outputChatBox("#63DBFF*Musisz być w pojeździe.",ps,0,0,0,true)
    end
end)

addCommandHandler("za",function (ps)
    if isPedInVehicle(ps) then
        local vehicle = getPedOccupiedVehicle(ps)
        local acceleration = getVehicleHandlingProperty(vehicle,"engineAcceleration")
        setVehicleHandling(vehicle,"engineAcceleration",tonumber(acceleration)-1)
        outputChatBox("#63DBFF*Zmniejszyłeś akceleracje pojazdu.",ps,0,0,0,true)
        else
        outputChatBox("#63DBFF*Musisz być w pojeździe.",ps,0,0,0,true)
    end
end)