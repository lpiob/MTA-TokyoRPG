function startTravel()
for k, v in ipairs(getElementsByType("vehicle")) do
if not getElementData(v,"vehicle:travel") then
setElementData(v,"vehicle:travel",0)
end
end
end


function positionTravel()
for k1, v1 in ipairs(getElementsByType("vehicle")) do
local x, y, z = getElementPosition(v1)
if getElementData(v1,"x")~=x then
setElementData(v1,"x",x)
setElementData(v1,"y",y)
setElementData(v1,"z",z)
end
end
end

setTimer (function () for key, value in ipairs(getElementsByType("vehicle")) do
if not getElementData(value,"x") then
local x, y, z = getElementPosition(value)
setElementData(value,"x",x)
setElementData(value,"y",y)
setElementData(value,"z",z)
end
end
end,500,0)

function addTravel()
for key, value in ipairs(getElementsByType("vehicle")) do
local x, y, z = getElementPosition(value)
local x1 = getElementData(value,"x")
local y1 = getElementData(value,"y")
local z1 = getElementData(value,"z")
if getElementData(value,"vehicle:travel") then
local travelIn = getElementData(value,"vehicle:travel")
local travelNow = getDistanceBetweenPoints3D(x,y,z,x1,y1,z1)
local dc = travelIn+travelNow
setElementData(value,"vehicle:travel",dc)
setElementData(value,"x",x)
setElementData(value,"y",y)
setElementData(value,"z",z)
else
end
end
end

setTimer(startTravel,1000,0)
positionTravel()
setTimer(addTravel,50,0)