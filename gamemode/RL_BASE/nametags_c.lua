--[[
addEventHandler("onClientRender",getRootElement(), function()
    for key, value in ipairs(getElementsByType("player")) do
    --if value ~= localPlayer then
        local x, y, z = getElementPosition(value)
        local xs, ys, ds = getScreenFromWorldPosition(x,y,z)
        if ds ~= nil then
            if ds <= 15 then
                local r, g, b = getPlayerNametagColor(value)
                text = dxDrawText(getPlayerName(value),xs,ys,ys,xs,tocolor(r,g,b),1.2,"default")
            end
        end
        --end
end
end)
]]--
