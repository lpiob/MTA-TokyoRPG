businesses = {}
id = 0


addCommandHandler("createbusiness",function (ps,cmd,businessname,money)
  if getPlayerAccount(ps) then
  if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(ps)),aclGetGroup("Admin")) then
          if ( businessname and money ) then
          local business = createElement("business")
          setElementData(business,"b:money",tonumber(money))
          setElementData(business,"b:level",1)
          local name1 = string.gsub(businessname,"-"," ")
          local name2 = string.gsub(name1,"_"," ")
          if #name2 <= 24 then
          setElementData(business,"b:name",name2)
          setElementData(business,"b:owner",getPlayerAccount(ps))
          setElementData(business,"b:vowner","none")
          local employed = {}
          setElementData(business,"b:employed",employed)
          table.insert(businesses,business)
          outputChatBox("*Stworzyłeś biznes o nazwie "..name2..".",ps,255,255,255,true)
          setElementData(business,"b:id",id)
          id = id + 1
          else outputChatBox("*Nazwa biznesu jest zbyt długa limit to 24 znaków.",ps,255,255,255,true)
          end
          else outputChatBox("*Niewpisałeś nazwy biznesu lub pieniędzy biznesu.",ps,255,255,255,true)
      end
      else outputChatBox("*Niemasz wystarczających praw do używania tej funkcji.",ps,255,255,255,true)
  end
  else outputChatBox("*Musisz być zalogowany.",ps,255,255,255,true)
end
end)

addCommandHandler("businesslist",function (ps)
outputChatBox("Biznesów "..#businesses..".",ps,255,255,255,true)
for key, value in ipairs(businesses) do
outputChatBox("[#"..getElementData(value,"b:id").."] Biznes: "..getElementData(value,"b:name").." | Poziom: "..getElementData(value,"b:level").." | Zarobki: "..getElementData(value,"b:money").."$",ps,255,255,255,true)
end
end)

function lol(tablex) if type(tablex)~= "number" or tablex == 0 then return 0 else return #tablex end end

setTimer(function () for key, value in ipairs(businesses) do
local owner = getElementData(value,"b:owner")
local vowner = getElementData(value,"b:vowner")
local money = getElementData(value,"b:money")
local omoney = money/2/2
local online = {}
if ( getElementData(value,"b:employed") ) ~= "none" then
for k, v in ipairs(getElementData(value,"b:employed")) do
if getAccountPlayer(value) then
table.insert(online,getAccountPlayer(value))
end
end
end
if #online > 0 then
for key, value in ipairs(online) do
givePlayerMoney(value,money/2/#online)
end
else online = 0
end
if getAccountPlayer(owner) then
if type(vowner)~="string" then
if not getAccountPlayer(vowner) then
givePlayerMoney(getAccountPlayer(owner),money/2)
outputChatBox("**BIZNES** ["..getElementData(value,"b:name").."] Wypłacono Właścicielowi: "..(money/2).."$ | Wypłacono Vice-Właścicelowi: 0$ | Wypłacono zatrudnionym: "..lol(online).."$.",getAccountPlayer(owner),255,255,255,true)
else
givePlayerMoney(getAccountPlayer(owner),money/2/2)
givePlayerMoney(getAccountPlayer(vowner),money/2/2)
outputChatBox("**BIZNES** ["..getElementData(value,"b:name").."] Wypłacono Właścicielowi: "..(money/2/2).."$ | Wypłacono Vice-Właścicelowi: "..(money/2/2).."$ | Wypłacono zatrudnionym: "..lol(online).."$.",getAccountPlayer(owner),255,255,255,true)
outputChatBox("**BIZNES** ["..getElementData(value,"b:name").."] Wypłacono Właścicielowi: "..(money/2/2).."$ | Wypłacono Vice-Właścicelowi: "..(money/2/2).."$ | Wypłacono zatrudnionym: "..lol(online).."$.",getAccountPlayer(vowner),255,255,255,true)
end
else 
givePlayerMoney(getAccountPlayer(owner),money/2)
outputChatBox("**BIZNES** ["..getElementData(value,"b:name").."] Wypłacono Właścicielowi: "..(money/2).."$ | Wypłacono Vice-Właścicelowi: 0$ | Wypłacono zatrudnionym: "..lol(online).."$.",getAccountPlayer(owner),255,255,255,true)
end
end
end
--if not i
end,60000,0)

function getBusinessFromID(id)
for key, value in ipairs(businesses) do
if getElementData(value,"b:id")==id then
return value
else return false
end
end
end

function getAccountBusinessRank(businessid,account)
if getBusinessFromID(businessid) then
 local business = getBusinessFromID(businessid)
 if isElement(account) then
 if isAccountInBusiness(business,account) then
 if getElementData(business,"b:owner")==account then
 return "owner"
 elseif getElementData(business,"b:vowner")==account then
 return "vowner"
 else if test(business,account) then
 return "employed"
end
end
end
end
end
 

function test(business,account)
if getElementData(business,"b:employed")>0 then
for key, value in ipairs(getElementData(business,"b:employed")) do
if account == value then 
return true
end
end
end
end

function isAccountInBusiness(business,account)
if getAccount(getAccountName(account)) then
 if isElement(business) then
 if getElementType(business)=="business" then
 if ( getElementData(business,"b:owner")==account  or getElementData(business,"b:vowner")==account or test(business,account) ) then
 return true
 else return false
 end
 else return false
 end
 else return false
 end
 else return false
end

       
 
  
  
 
--[[
addCommandHandler("setrank",function (ps,cmd,id,player,rank)
local player = getPlayerFromName(player)
if ( getBusinessFromID(id) ) then
 local business = getBusinessFromID(id)
 if ( getElementData(business,"b:owner")==getPlayerAccount(ps) or getElementData(business,"b:vowner")==getPlayerAccount(ps) ) then
 if ( player ) then
 if getPlayerAccount(player) then
 local account = getPlayerAccount(player)
 if ( rank ~= "owner" ) then
 if ( rank == "vowner" ) then
 setElementData(account,"b:vowner",account)
 elseif ( rank == "employed" ) then
 --if not isElement(account) in getElementData(business,"b:employed") then -- Jak sprawdzić czy dana rzecz jest w tabeli.
 table.insert(getElementData(business,"b:employed"),account)
 ]]--
  
  