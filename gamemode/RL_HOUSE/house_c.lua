addEventHandler("onClientRender",getRootElement(),function ()
for key, value in ipairs(getElementsByType("marker")) do
if getElementData(value,"house") then
local x, y, z = getElementPosition(value)
local xs, ys, ds = getScreenFromWorldPosition(x,y,z)
if ds~=nil then if ds <= 15 then
dxDrawText("  Dom \nTyp ["..getElementData(value,"mode").."] \n Właśćiciel: "..getElementData(value,"ownern").." \nCena: "..getElementData(value,"cost").."$",xs,ys+15,xs,ys,tocolor(255,255,255),1.2,"default","center")
end end end end end)