-----------------------------------------------------------------------------------------
--
-- main.lua
--11/15/2015
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")

local physics = require("physics")
physics.start(true)
physics.setGravity(0, 1.9)

local displayX1 = display.contentWidth
local displayX2 = display.contentWidth/2
local displayY1 = display.contentHeight
local displayY2 = display.contentHeight/2
local rectW = displayY1/2
local rectH = displayY1/3

--scoring and groups
local score = 0
local health = 3

--Background
local background = display.newImage("background.jpg", displayX2, displayY2)
background.width = displayX1
background.height = displayY1


--show score
local scoreText = display.newText("Score: "..score, displayX1 - displayX1/2, 20, native.systemFont, 26)

--show health
local healthText = display.newText("Health: "..health, displayX1 - displayX1/8, 20, native.systemFont, 26)



--Graphics of rocket ship
local sheet1 = graphics.newImageSheet("rocketship copy.png", {width = 320, height = 320, numFrames = 4})
local rocketShip = display.newSprite(sheet1, {name = "rocketShip", start = 1, count = 4, time = 200})
rocketShip:scale(displayX2/847, displayX2/787, displayX2/600) -- width, height, no effect
rocketShip.x = displayX2
rocketShip.y = displayY2 + displayY2/1.6
rocketShip:play()

--physics for rocket ship
local rocketShipShape = {-45,-90, 35,-90, 35,90, -45,90}
physics.addBody(rocketShip, "kinematic", {density = 0, friction = 0, bounce = 0, shape = rocketShipShape})
rocketShip.isBullet = true


--controls/buttons
local rightRect = display.newRect(displayX1 - rectW/2 , displayY1 - rectH/2, rectW, rectH)
rightRect.alpha = .01
local rightText = display.newText("Move Right", displayX1 - rectW/2, displayY1 - rectH/2, native.systemFont, 38)
rightRect:setFillColor(0,0,0)

local leftRect = display.newRect(rectW/2, displayY1 - rectH/2, rectW, rectH)
leftRect.alpha = .01
local leftText = display.newText("Move Left", rectW/2,  displayY1 - rectH/2, native.systemFont, 38)
leftRect:setFillColor(0,0,0)

function handlerEnterFrameRight(event)
	if(movingRight == true) then
		moveRight()
	end
end
Runtime:addEventListener("enterFrame", handlerEnterFrameRight)

--function to move rocket ship right
function moveRight()
	if (rocketShip.x < displayX1 - rocketShip.width/6) then
		rocketShip.x  = rocketShip.x + 12
	end
end

function handlerightButton(event)
	if (event.phase == "began") then
		--move right
		moveRight()
		movingRight = true
	elseif(event.phase == "ended" and movingRight==true)then
		--stop moving right
		moveRight()
		movingRight = false
	end
	return true
end
rightRect:addEventListener("touch", handlerightButton)

function handlerEnterFrameLeft(event)
	if(movingLeft == true) then
		moveLeft()
	end
end
Runtime:addEventListener("enterFrame", handlerEnterFrameLeft)

--function that moves rocket ship left
function moveLeft()
	if rocketShip.x > rocketShip.width/6 then
		rocketShip.x  = rocketShip.x - 12
	end
end

function handleleftButton(event)
	if (event.phase == "began") then
		--move left
		moveLeft()
		movingLeft = true
	elseif(event.phase == "ended" and movingLeft == true)then
		--stop moving left
		moveLeft()
		movingLeft = false
	end
	return true
end
leftRect:addEventListener("touch", handleleftButton)