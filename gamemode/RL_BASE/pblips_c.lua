--[[*****************************************************************************
*
*  PROJECT:     PlayerBlips
*  LICENSE:     GNU GPLv3
*  FILE:        :PlayerBlips/cPlayerBlips.lua
*  PURPOSE:     Player blips.
*  DEVELOPERS:  John_Michael <JohnMichaelFFS@gmail.com>
*  
********************************************************************************
local playerBlipRoot = createElement("playerBlipRoot", "playerBlipRoot")

--This function creates blips for all players when the resource starts.
local function resourceStart()
    for _, player in ipairs(getElementsByType("player")) do
        if player ~= localPlayer then
            local r, g, b = getPlayerNametagColor(player)
            local blip = createBlipAttachedTo(player, 0, 2, r, g, b, 255, 1)
            setElementParent(blip, playerBlipRoot)
        end
    end
end
addEventHandler("onClientResourceStart", root, resourceStart)

--This function creates a blip for new players when they join.
local function playerJoin()
    local r, g, b = getPlayerNametagColor(source)
    local blip = createBlipAttachedTo(source, 0, 2, r, g, b, 255, 1)
    setElementParent(blip, playerBlipRoot)
    setTimer(updateBlipColor, 5000, 1, blip) --Upadate in 5 seconds, in case the server sets the color.
end
addEventHandler("onClientPlayerJoin", root, playerJoin)

--This function destroys a players blip when they quit.
local function playerQuit()
    for _, blip in ipairs(getElementChildren(playerBlipRoot)) do
        if getElementAttachedTo(blip) == source then
            destroyElement(blip)
        end
    end
end
addEventHandler("onClientPlayerQuit", root, playerQuit)

--This function updates a blip's color, ensuring the blip colors always match.
function updateBlipColor(blip)
    local player = getElementAttachedTo(blip)
    if player then
        local r, g, b = getPlayerNametagColor(player)
        setBlipColor(blip, r, g, b, 255)
    end
    end
    ]]--