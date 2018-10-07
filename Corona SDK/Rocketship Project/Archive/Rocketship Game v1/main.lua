-----------------------------------------------------------------------------------------
--
-- main.lua 
-- 4/3/16
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")

local physics = require("physics")
physics.start(true)
physics.setGravity(0, 1.9)

local Width = display.contentWidth
local halfWidth = display.contentWidth/2
local Height = display.contentHeight
local halfHeight = display.contentHeight/2
local rectW = Width/2
local rectH = Height/3

--scoring and groups
local score = 0
local health = 3

--Background
local background = display.newImage("background.jpg", halfWidth, halfHeight)
background.width = Width
background.height = Height


--show score
local scoreText = display.newText("Score: "..score, Width - Width/2, 20, native.systemFont, 26)

--show health
local healthText = display.newText("Health: "..health, Width - Width/8, 20, native.systemFont, 26)



--Graphics of rocket ship
local sheet1 = graphics.newImageSheet("rocketShip.png", {width = 64, height = 64, numFrames = 17})
local rocketShip = display.newSprite(sheet1, {name = "rocketShip", start = 1, count = 17, time = 200})
rocketShip.x = halfWidth
rocketShip.y = halfHeight + halfHeight/1.6
rocketShip:play()

--physics for rocket ship
--local rocketShipShape = {-45,-90, 35,-90, 35,90, -45,90}
--physics.addBody(rocketShip, "kinematic", {density = 0, friction = 0, bounce = 0, shape = rocketShipShape})
--rocketShip.isBullet = true


--initializing right and left buttons
local rightRect = display.newRect(Width - rectW/4 , Height - rectH/2, rectW, rectH)
rightRect.alpha = .01
local rightText = display.newText("Move Right", Width - rectW/4, Height - rectH/2, native.systemFont, 30)
rightRect:setFillColor(0,0,0)
rightText.alpha = .4

local leftRect = display.newRect(rectW/4, Height - rectH/2, rectW, rectH)
leftRect.alpha = .01
local leftText = display.newText("Move Left", rectW/4,  Height - rectH/2, native.systemFont, 30)
leftRect:setFillColor(0,0,0)
leftText.alpha = .4


--functions for left and right buttons


--function to move rocketship right
function handlerEnterFrameRight(event)
	if(movingRight == true) then
		moveRight()
	end
end
Runtime:addEventListener("enterFrame", handlerEnterFrameRight)

function moveRight()
	if (rocketShip.x < Width) then
		rocketShip.x  = rocketShip.x + 8
	end
end

function handlerightButton(event)
	if (event.phase == "began") then
		--move right
		moveRight()
		movingRight = true
		rightText.alpha = .2
		leftText.alpha = .2
	elseif(event.phase == "ended" and movingRight==true)then
		--stop moving right
		moveRight()
		movingRight = false
		rightText.alpha = .35
		leftText.alpha = .35
	end
	return true
end
rightRect:addEventListener("touch", handlerightButton)


--function that moves rocketship left
function handlerEnterFrameLeft(event)
	if(movingLeft == true) then
		moveLeft()
	end
end
Runtime:addEventListener("enterFrame", handlerEnterFrameLeft)


function moveLeft()
	if (rocketShip.x > 0) then
		rocketShip.x  = rocketShip.x - 8
	end
end

function handleleftButton(event)
	if (event.phase == "began") then
		--move left
		moveLeft()
		movingLeft = true
		rightText.alpha = .2
		leftText.alpha = .2
	elseif(event.phase == "ended" and movingLeft == true)then
		--stop moving left
		moveLeft()
		movingLeft = false
		rightText.alpha = .35
		leftText.alpha = .35
	end
	return true
end
leftRect:addEventListener("touch", handleleftButton)