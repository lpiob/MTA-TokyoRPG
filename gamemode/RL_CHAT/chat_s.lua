function RGBToHex(red, green, blue, alpha)
    if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
        return nil
    end
    if(alpha) then
        return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
    else
        return string.format("#%.2X%.2X%.2X", red,green,blue)
    end
end



function onChat(message,messagetype)
    
     if isGuestAccount(getPlayerAccount(psource)) then
        outputChatBox("Najpierw wejdź do gry.", psource, 255, 000, 000)
        return end
    
    if messagetype == 0 then
        cancelEvent()
        local x, y, z = getElementPosition(source)
        local chatCol = createColSphere(x,y,z,20)
        local chatRadius = getElementsWithinColShape(chatCol)
        local r, g, b = getPlayerNametagColor(source)
        for key, value in ipairs(chatRadius) do 
        outputChatBox(getPlayerName(source).."#FFFFFF: "..message,value,r,g,b,true)
    end
        elseif messagetype == 1 then
        cancelEvent()
        local x, y, z = getElementPosition(source)
        local chatCol = createColSphere(x,y,z,30)
        local chatRadius = getElementsWithinColShape(chatCol)
        for key, value in ipairs(chatRadius) do 
        outputChatBox("#FF5555*"..getPlayerName(source).." "..message,value,0,0,0,true)
    end
end
end
end


addEventHandler("onPlayerChat",getRootElement(),onChat)

function global(psource,command,...)
    if isGuestAccount(getPlayerAccount(psource)) then
        outputChatBox("Najpierw wejdź do gry.", psource, 255, 000, 000)
        return end
    
local tekst = table.concat({...}," ")
r,g,b = getPlayerNametagColor(psource)
outputChatBox("#FFFFFF[Global]"..RGBToHex(r,g,b)..getPlayerName(psource).."#FFFFFF: "..tekst,getRootElement(),r,g,b,true)
end

addCommandHandler("global",global)


addEventHandler("onPlayerLogin",getRootElement(),function ()
bindKey(source,"u","down","chatbox","global")
end)
