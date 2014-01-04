 
function remove()
for k, v in ipairs(getElementsByType("object")) do
    removeWorldModel(658,10000,0,0,0,0)
    removeWorldModel(698,10000,0,0,0,0)
    removeWorldModel(688,10000,0,0,0,0)
end
end
remove()
setOcclusionsEnabled(false)


-- Setting water properties.
height = 20
SizeVal = 2998
-- Defining variables.
southWest_X = -SizeVal
southWest_Y = -SizeVal
southEast_X = SizeVal
southEast_Y = -SizeVal
northWest_X = -SizeVal
northWest_Y = SizeVal
northEast_X = SizeVal
northEast_Y = SizeVal
 
-- OnClientResourceStart function that creates the water.
function thaResourceStarting( )
    water = createWater ( southWest_X, southWest_Y, height, southEast_X, southEast_Y, height, northWest_X, northWest_Y, height, northEast_X, northEast_Y, height )
    setWaterLevel ( height )
end
thaResourceStarting()




function table.random ( theTable )
    return theTable[math.random ( #theTable )]
end

positions = {
{-2148.2521972656, 1517.259765625, 81.168746948242},
{-2150.6398925781, 1512.298828125, 81.168746948242},
{-2154.2385253906, 1507.83984375, 81.168746948242},
{-2152.1721191406, 1494.0029296875, 81.168746948242},
{-2154.3273925781, 1488.9169921875, 81.168746948242},
{-2157.7541503906, 1484.5087890625, 81.168746948242},
{-2160.5051269531, 1479.8291015625, 81.168746948242},
{-2163.3762207031, 1475.1796875, 81.168746948242},
{-2166.5197753906, 1470.482421875, 81.168746948242},
{-2168.5598144531, 1465.326171875, 81.168746948242},
{-2171.6369628906, 1460.7529296875, 81.168746948242},
{-2150.6884765625, 1461.4284667969, 81.168746948242},
{-2153.8908691406, 1456.8359375, 81.168746948242},
{-2156.5158691406, 1451.8330078125, 81.168746948242},
{-2158.8037109375, 1446.9313964844, 81.168746948242},
{-2162.142578125, 1442.4460449219, 81.168746948242},
{-2165.326171875, 1438.2341308594, 81.168746948242},
{-2168.0546875, 1433.0895996094, 81.168746948242},
{-2170.6953125, 1428.4938964844, 81.168746948242},
{-2173.4072265625, 1423.8229980469, 81.168746948242},
{-2176.5205078125, 1419.3249511719, 81.168746948242},
{-2179.0595703125, 1414.3347167969, 81.17569732666},
{-2177.5205078125, 1400.5827636719, 81.168746948242},
{-2180.1708984375, 1395.7858886719, 81.168746948242},
{-2182.80859375, 1390.7380371094, 81.168746948242},
{-2179.9189453125, 1446.7429199219, 81.168746948242},
{-2176.541015625, 1451.0827636719, 81.168746948242},
{-2174.20703125, 1456.1950683594, 81.168746948242}}

function fixBuggedVehicles()
for key, value in ipairs(getElementsByType("vehicle")) do
if isElementInWater(value) then
local x, y, z = unpack(table.random(positions))
setElementPosition(value,x,y,z)
--setElementFrozen(value,true)
--setVehicleDamageProof(value,true)
setElementRotation(value,0,0,rand())
end
end
end

function rand()
local r = math.random(1,2)
if r == 1 then
return 240
else
return 60
end
end


setTimer(fixBuggedVehicles,1000,0)


function playerTryToLeave()
for k, v in ipairs(getElementsByType("player")) do
if getPlayerAccount(v) then
if isElementInWater(v) then
setElementPosition(v,-2100.265625,1881.0595703125,82.2734375)
outputChatBox("*Próbowałeś uciec z mapy! Zostałeś przeniesiony do gry.",v,255,0,0)
end
end
end
end

setTimer(playerTryToLeave,1000,0)


function createLOD()
for k, v in ipairs(getElementsByType("object")) do
local x, y, z = getElementPosition(v)
local xr, yr, zr = getElementRotation(v)
local modelid = getElementModel(v)
local scale = getObjectScale(v)
if modelid == not 974 or 4246 or 6387 then
local lodobject = createObject(modelid,x,y,z,xr,yr,zr,true)
setElementData(lodobject,"lod",true)
setObjectScale(lodobject,scale)
end
end
end

createLOD()


function repairx()
for k, v in ipairs(getElementsByType("object")) do
if getElementModel(v)==4246
then setElementAlpha(v,0)
end
end
end

repairx()

function repairxx()
for k, v in ipairs(getElementsByType("object")) do
if getElementModel(v)==974
then setElementAlpha(v,0)
end
end
end

repairxx()

setFogDistance(150)
setFarClipDistance(650)

addEventHandler("onVehicleExplode",getRootElement(),function ()
local vehicle = source
local x, y, z = getElementPosition(vehicle)
setTimer(function () spawnVehicle(vehicle,x,y,z+0.25,0,0,0)end,4500,1)
end)

-- Od teraz stary hud będzie znikał. Oprócz poziomu ścigania przez policję.
setTimer(function () for key, value in ipairs(getElementsByType("player")) do
 showPlayerHudComponent(value,"money",false)
 showPlayerHudComponent(value,"health",false)
 showPlayerHudComponent(value,"armour",false)
 showPlayerHudComponent(value,"weapon",false)
 showPlayerHudComponent(value,"clock",false)
 showPlayerHudComponent(value,"ammo",false)
 showPlayerHudComponent(value,"breath",false)
end
end,2000,0
)
