local element = "pickup"
local enabled = true
local streamdistance = 25

local function checkStreamIn()
	if ( enabled ) then
		local x, y, z = getElementPosition(  getLocalPlayer() )
		local playerdimension = getElementDimension (  getLocalPlayer() )
		
		for key, value in pairs(getElementsByType(element)) do
				local vx, vy, vz = getElementPosition(value)
				local distx = x - vx
				local disty = y - vy
					
				if (distx < 0) then
					distx = distx - distx - distx
				end
				if (disty < 0) then
					disty = disty - disty - disty
				end
					
				if (distx < streamdistance) and (disty < streamdistance) then
					-- Stream them in
					streamInElement2( value )
				else
					-- Stream them out
					streamOutElement2(value)
				end
		end
	end
end
setTimer(checkStreamIn, 1000, 0)

local function isElementStreamedOut ( theElement )
	return getElementDimension( theElement ) == 65256
end

function streamOutElement2( theElement )
	if  (getElementType(theElement) == element ) and not (isElementStreamedOut(theElement)) then
		local currentDimension = getElementDimension( theElement )
		setElementDimension(theElement, 65256)
		setElementData(theElement, "streamer:"..element..":dimension", currentDimension, false)
	end
end

function streamInElement2( theElement )
	if  (getElementType(theElement) == element ) and (isElementStreamedOut(theElement)) then
		local destinationDimension = getElementData(theElement, "streamer:"..element..":dimension") or 0
		setElementDimension(theElement, destinationDimension)
		setElementData(theElement, "streamer:"..element..":dimension", false, false)
	end
end

addEventHandler("onClientElementStreamOut", getRootElement(),
	function ()
		if (getElementType(source) == element and enabled) then
			 streamOutElement2( source )
		end
	end
);

local function streamerStop(resource)
	if (resource == getThisResource()) then
		for key, value in pairs(getElementsByType(element)) do
			streamInElement2(value)
		end
	end
end
addEventHandler("onClientResourceStop", getRootElement(), streamerStop)