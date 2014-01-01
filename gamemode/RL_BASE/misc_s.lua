
-- WYPŁATA [nie konieczne] --
setTimer( function ()
    for key, value in ipairs(getElementsByType("player")) do
    if getPlayerAccount(value) then
    local random = math.random(100,250)
        givePlayerMoney(value,random)
        outputChatBox("#FFFFFF[WYPŁATA] Dostałeś #00FF00"..random.."$#FFFFFF za grę na serwerze.",value,0,0,0,true)
    end
end
end, 900000, 0)


    
--[[ ZWROT PODATKU [nie konieczne]
setTimer( function ()
    for k, v in ipairs(getElementsByType("player")) do
    if getPlayerAccount(v) then
        local r = math.random(500,1500)
        givePlayerMoney(v,r)
        outputChatBox("#FFFFFF[ZWROT PODATKU] Dostałeś #00FF00"..r.."$#FFFFFF za zwrot podatku.",v,0,0,0,true)
    end
end
end, 2700000)
--]]

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



addEventHandler("onPlayerLogin",getRootElement(),function (pcc,acc)
if not getAccountData(acc,"joined") then
givePlayerMoney(source,5000)
outputChatBox("#FFFFFF[SYSTEM]#63DBFF*Witamy cie pierwszy raz na serwerze dostałeś #B9F46C5000$#63DBFF na początek gry! #B9F46CPowodzenia!",source,0,0,0,true)
setAccountData(acc,"joined",true)
else
local r, g, b = getPlayerNametagColor(source)
local hex = RGBToHex(r,g,b)
outputChatBox("#FFFFFF[SYSTEM]#63DBFF*Witamy cie ponownie "..hex..getPlayerName(source).."#63DBFF.",source,r,g,b,true)
end
end)



function givecash(playerSource,dajkase,target,money)
target = getPlayerFromName(target)
if target then if getPlayerMoney(playerSource)>=tonumber(money)
then if tonumber(money) > 0 then takePlayerMoney(playerSource,tonumber(money)) givePlayerMoney(target,tonumber(money))
outputChatBox("#FFFFFF[SYSTEM]#63DBFF*Otrzymałeś #B9F46C"..money.."$ #63DBFFod #B9F46C"..getPlayerName(playerSource).."#63DBFF.",target,0,0,0,true)
outputChatBox("#FFFFFF[SYSTEM]#63DBFF*Oddałeś #B9F46C"..money.."$ #63DBFFdla #B9F46C"..getPlayerName(target).."#63DBFF.",playerSource,0,0,0,true)
end
end
end
end

addCommandHandler("dajkase",givecash)



addEventHandler("onVehicleDamage",getRootElement(), function (loss)
if not getVehicleController(source) then
if getElementHealth(source)>300 then
setElementHealth(source,getElementHealth(source)+loss)
end
end
end)

addCommandHandler("skin",function (ps,cmd,skinx)
if getElementInterior(ps)== 14 then
local skin = tonumber(skinx)
if skin ~=  50 or skin ~=102 or skin ~=103 or skin ~=104 or skin ~=105 or skin ~=106 or skin ~=107 or skin ~=108 
or skin ~=109 or skin ~=110 or skin ~=111 or skin ~=112 or skin ~=113 or skin ~=114 or skin ~=115 or skin ~=116 or skin ~=117 or skin ~=118 or skin ~=119 or skin ~=120 or skin ~=121
or skin ~=122 or skin ~=123 or skin ~=124 or skin ~=125 or skin ~=126 or skin ~=275 or skin ~=276 or skin ~=277 or skin ~=278 or skin ~=279 or skin ~=280 or skin ~=281 or skin ~=282 
or skin ~=283 or skin ~=284 or skin ~=285 or skin ~=286 or skin ~=287 or skin ~=288  then
setElementModel(ps,skin)
outputChatBox("#FFFFFF[SKLEP]#63DBFF*Przebrałeś się.",ps,0,0,0,true)
else
outputChatBox("#FFFFFF[SKLEP]#63DBFF*Nie możesz wybrać tego stroju.",ps,0,0,0,true)
end
else
outputChatBox("#FFFFFF[SYSTEM]#63DBFF*Musisz być w sklepie odzieżowym.",ps,0,0,0,true)
end
end)


--[[
function setMarker()
for key1, value1 in ipairs(getElementsByType("player")) do
for key, value in ipairs(getElementsByType("marker")) do
if isElementWithinMarker(value1,value) then
setElementData(value1,"player:marker",value)
else setElementData(value1,"player:marker",nil)
setElementData(source,"player:house_canenter",nil)
end
end
end
end

setTimer(setMarker,50,0)
]]--



addCommandHandler("wyslijnews",function (ps,cmd,...) local message = table.concat({...}," ")  local nick = getPlayerName(ps) triggerClientEvent("onNewsMessage",ps,nick,message)end )

setTimer(function ()
for key, value in ipairs(getElementsByType("marker")) do
if getElementData(value,"house") then
if getAccountPlayer(getElementData(value,"house:owner")) then
setElementData(value,"house:owner_player",getAccountPlayer(getElementData(value,"house:owner")))
else
setElementData(value,"house:owner_player",nil)
end
end
end
end,50,0)