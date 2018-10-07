-----------------------------------------------------------------------------------------
--
-- main.lua
--Robert Vitali
-- May 8
-- Maze
-----------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")

local physics = require("physics") 
physics.start(true) 
physics.setGravity(0, 1.9)

-- Your code here
--display
local displayX1 = display.contentWidth
local displayX2 = display.contentWidth/2
local displayY1 = display.contentHeight
local displayY2 = display.contentHeight/2
local rectW = displayY1/3
local rectH = displayY1/4

--random numbers in variables
local ranX1 = math.random(0, displayX1) 
local ranX2 = math.random(0, displayX1)
local ranX3 = math.random(0, displayX1)
local ranX4 = math.random(0, displayX1)
local ranX5 = math.random(0, displayX1)
local ranX6 = math.random(0, displayX1)
local ranX7 = math.random(0, displayX1)
local ranX8 = math.random(0, displayX1)
local ranX9 = math.random(0, displayX1)
local ranX10 = math.random(0, displayX1)
local ranX11 = math.random(0, displayX1)
local ranX12 = math.random(0, displayX1)
local ranX13 = math.random(0, displayX1)
local ranX14 = math.random(0, displayX1)
local ranY1 = math.random(-1500, -150) * (math.random(1, 4))
local ranY2 = math.random(-1500, -150) * (math.random(1, 3))
local ranY3 = math.random(-1500, -150) * (math.random(1, 3))
local ranY4 = math.random(-1500, -150) * (math.random(1, 3))
local ranY5 = math.random(-1500, -150) * (math.random(1, 3))
local ranY6 = math.random(-1000, -150) * (math.random(1, 6))
local ranY7 = math.random(-1000, -150) * (math.random(1, 6))
local ranY8 = math.random(-1000, -150) * (math.random(1, 6))
local ranY9 = math.random(-1000, -150) * (math.random(1, 6))
local ranY10 = math.random(-1000, -150) * (math.random(1, 6))
local ranY11 = math.random(-1000, -150) * (math.random(1, 6))
local ranY12 = math.random(-1000, -150) * (math.random(1, 6))
local ranY13 = math.random(-1000, -150) * (math.random(1, 6))
local ranY14 = math.random(-1000, -150) * (math.random(1, 6))
local velO = 2 

--scoring and groups
local score = 0
local timerSec = 0
local gameGroup = display.newGroup()
local gameOverGroup = display.newGroup()

--show score
local scoreText = display.newText("Score: "..score, displayX1 - 100, 30, native.systemFont, 36)

--lives
local lives = 6
local livesText = display.newText("Lives: "..lives, displayX1 - 100, 40, native.systemFont, 36)

--timer
local timerText = display.newText("Seconds: "..timerSec, 100, 30, native.systemFont, 36)

--game over text
local gameOverText = display.newText("Game Over Your Score: "..score, -9000, -9000, native.systemFont, 48)
local gameOverText2 = display.newText("Click Here To Play Again", -9000, -9000, native.systemFont, 48)
local resetButtonText = display.newText("Reset Game", -9000, -9000, native.systemFont, 48)

--reset Button
local resetButton = display.newRect(displayX2, displayY2 + 120, 300, 100)
resetButton.alpha = 0
gameOverGroup:insert(resetButton)

--all booleans
local star1Collision = false
local star2Collision = false
local star3Collision = false
local star4Collision = false
local star5Collision = false
local star6Collision = false
local asteroid1Collision = false
local asteroid2Collision = false
local asteroid3Collision = false
local asteroid4Collision = false
local asteroid5Collision = false
local asteroid6Collision = false
local asteroid7Collision = false
local asteroid8Collision = false
local movingLeft = false
local movingRight = false
local gameOverBoolean = false

--Background
local galaxyBackground = display.newImage("background.jpg", displayX2, displayY2)
galaxyBackground.width = displayX1
galaxyBackground.height = displayY1

--shape of rocketship
local rocketShipShape = {-45,-90, 35,-90, 35,90, -45,90}
--local testr = display.newRect(-45, -90, 110, 180)
--testr:setFillColor(1,0,0)

--Graphic of rocket ship
local sheet1 = graphics.newImageSheet("rocketship copy.png", {width = 320, height = 320, numFrames = 4})
local rocketShip = display.newSprite(sheet1, {name = "rocketship", start = 1, count = 4, time = 200})
--rocketShip:scale(.3,.3,.3)
rocketShip.x = displayX2
rocketShip.y = displayY2 + 100
rocketShip:play()
physics.addBody(rocketShip, "kinematic", {density = 0, friction=0, bounce=0, shape = rocketShipShape})
rocketShip.isBullet = true
rocketShip.myName = "rocketship"

--laser
--local sheet2 = graphics.newImageSheet("Laser.png", {width = 128, height = 128, numFrames = 3})
----print(sheet2)
--local laser =  display.newSprite(sheet2, {name = "redLaser", start = 1, count = 3, time = 1000})
----laser.x = displayX2 + 100
----laser.y = displayY2 + 100
--laser:play()

--stars
local star1 = display.newImage("Star.png", ranX1, ranY1)
physics.addBody(star1, "dynamic", {density=2, friction=0, bounce = 0 , radius = 64})
star1.myName = "star 1"

local star2 = display.newImage("Star.png", ranX2, ranY2)
physics.addBody(star2, "dynamic", {density=2, friction=0, bounce = 0, radius = 64})
star2.myName = "star 2"

local star3 = display.newImage("Star.png", ranX3, ranY3)
physics.addBody(star3, "dynamic", {density=2, friction=0, bounce = 0 , radius = 64})
star3.myName = "star 3"

local star4 = display.newImage("Star.png", ranX4, ranY4)
physics.addBody(star4, "dynamic", {density=2, friction=0, bounce = 0 , radius = 64})
star4.myName = "star 4"

local star5 = display.newImage("Star.png", ranX5, ranY5)
physics.addBody(star5, "dynamic", {density=2, friction=0, bounce = 0 , radius = 64})
star5.myName = "star 5"

local star6 = display.newImage("Star.png", ranX6, ranY6)
physics.addBody(star6, "dynamic", {density=2, friction=0, bounce = 0 , radius = 64})
star6.myName = "star 6"

--asteroids
local asteroid1 = display.newImage("asteroid.png", ranX7, ranY7)
physics.addBody(asteroid1, "dynamic", {density=5, friction=0, bounce=0, radius=106})
asteroid1.myName = "asteroid 1"

local asteroid2 = display.newImage("asteroid.png", ranX8, ranY8)
physics.addBody(asteroid2, "dynamic", {density=5, friction=0, bounce=0, radius=106})
asteroid2.myName = "asteroid 2"

local asteroid3 = display.newImage("asteroid.png", ranX9, ranY9)
physics.addBody(asteroid3, "dynamic", {density=5, friction=0, bounce=0, radius=106})
asteroid3.myName = "asteroid 3"

local asteroid4 = display.newImage("asteroid.png", ranX10, ranY10)
physics.addBody(asteroid4, "dynamic", {density=5, friction=0, bounce=0, radius=106})
asteroid4.myName = "asteroid 4"

local asteroid5 = display.newImage("asteroid.png", ranX11, ranY11)
physics.addBody(asteroid5, "dynamic", {density=5, friction=0, bounce=0, radius=106})
asteroid5.myName = "asteroid 5"

local asteroid6 = display.newImage("asteroid.png", ranX12, ranY12)
physics.addBody(asteroid6, "dynamic", {density=5, friction=0, bounce=0, radius=106})
asteroid6.myName = "asteroid 6"

local asteroid7 = display.newImage("asteroid.png", ranX13, ranY13)
physics.addBody(asteroid7, "dynamic", {density=5, friction=0, bounce=0, radius=106})
asteroid7.myName = "asteroid 7"

local asteroid8 = display.newImage("asteroid.png", ranX14, ranY14)
physics.addBody(asteroid8, "dynamic", {density=5, friction=0, bounce=0, radius=106})
asteroid8.myName = "asteroid 8"

--controls/buttons
local rightRect = display.newRect(displayX1 - rectW/2 , displayY1 - 100, rectW, rectH)
rightRect.alpha = .1
local rightText = display.newText("Move Right", displayX1 - rectW/2, displayY1 - rectH/2, native.systemFont, 38)

local leftRect = display.newRect(rectW/2, displayY1 - 100, rectW, rectH)
leftRect.alpha = .1
local leftText = display.newText("Move Left", rectW/2,  displayY1 - rectH/2, native.systemFont, 38)

--adding everything to group
gameGroup:insert(scoreText)
gameGroup:insert(livesText)
gameGroup:insert(timerText)
gameGroup:insert(galaxyBackground)
gameGroup:insert(rocketShip)
gameGroup:insert(rightRect)
gameGroup:insert(leftRect)
gameGroup:insert(rightText)
gameGroup:insert(leftText)
gameGroup:insert(star1)
gameGroup:insert(star2)
gameGroup:insert(star3)
gameGroup:insert(star4)
gameGroup:insert(star5)
gameGroup:insert(star6)
gameGroup:insert(asteroid1)
gameGroup:insert(asteroid2)
gameGroup:insert(asteroid3)
gameGroup:insert(asteroid4)
gameGroup:insert(asteroid5)
gameGroup:insert(asteroid6)
gameGroup:insert(asteroid7)
gameGroup:insert(asteroid8)

--function to randomize XY vals
function randomizeXYVals()
if gameOverBoolean == false then
	ranX1 = math.random(0, displayX1) 
	ranX2 = math.random(0, displayX1)
	ranX3 = math.random(0, displayX1)
	ranX4 = math.random(0, displayX1)
	ranX5 = math.random(0, displayX1)
	ranX6 = math.random(0, displayX1)
	ranX7 = math.random(0, displayX1)
	ranX8 = math.random(0, displayX1)
	ranX9 = math.random(0, displayX1)
	ranX10 = math.random(0, displayX1)
	ranX11 = math.random(0, displayX1)
	ranX12 = math.random(0, displayX1)
	ranX13 = math.random(0, displayX1)
	ranX14 = math.random(0, displayX1)
	ranY1 = math.random(-1500, -150) * (math.random(1, 4))
	ranY2 = math.random(-1500, -150) * (math.random(1, 3))
	ranY3 = math.random(-1500, -150) * (math.random(1, 3))
	ranY4 = math.random(-1500, -150) * (math.random(1, 3))
	ranY5 = math.random(-1500, -150) * (math.random(1, 3))
	ranY6 = math.random(-1000, -150) * (math.random(1, 6))
	ranY7 = math.random(-1000, -150) * (math.random(1, 6))
	ranY8 = math.random(-1000, -150) * (math.random(1, 6))
	ranY9 = math.random(-1000, -150) * (math.random(1, 6))
	ranY10 = math.random(-1000, -150) * (math.random(1, 6))
	ranY11 = math.random(-1000, -150) * (math.random(1, 6))
	ranY12 = math.random(-1000, -150) * (math.random(1, 6))
	ranY13 = math.random(-1000, -150) * (math.random(1, 6))
	ranY14 = math.random(-1000, -150) * (math.random(1, 6))
	velO = 2 * timerSec
end
end
local randomizeXYtimer = timer.performWithDelay(100, randomizeXYVals, 0)


--function to reset stuff if they go off the screen
function resetStuff()
if (lives < 1) then
	gameOverBoolean = true
elseif gameOverBoolean == false then
		if (star1.y > displayY1 + 60) then
			star1.x = ranX1
			star1.y = ranY1
		elseif (star2.y > displayY1 + 60) then
			star2.x = ranX2
			star2.y = ranY2
		elseif (star3.y > displayY1 + 60) then
			star3.x = ranX3
			star3.y = ranY3
		elseif (star4.y > displayY1 + 60) then
			star4.x = ranX4
			star4.y = ranY4
		elseif (star5.y > displayY1 + 60) then
			star5.x = ranX5
			star5.y = ranY5
		elseif (star6.y > displayY1 + 60) then
			star6.x = ranX6
			star6.y = ranY6
		elseif (asteroid1.y > displayY1 + 200) then
			asteroid1.x = ranX7
			asteroid1.y = ranY7
		elseif (asteroid2.y > displayY1 + 200) then
			asteroid2.x = ranX8
			asteroid2.y = ranY8
		elseif (asteroid3.y > displayY1 + 200) then
			asteroid3.x = ranX9
			asteroid3.y = ranY9
		elseif (asteroid4.y > displayY1 + 200) then
			asteroid4.x = ranX10
			asteroid4.y = ranY10
		elseif (asteroid5.y > displayY1 + 200) then
			asteroid5.x = ranX11
			asteroid5.y = ranY11
		elseif (asteroid6.y > displayY1 + 200) then
			asteroid6.x = ranX12
			asteroid6.y = ranY12
		elseif (asteroid7.y > displayY1 + 200) then
			asteroid7.x = ranX13
			asteroid7.y = ranY13
		elseif (asteroid8.y > displayY1 + 200) then
			asteroid8.x = ranX14
			asteroid8.y = ranY14
		end
	timerSec = timerSec+.1
	scoreText:removeSelf()
	scoreText = display.newText("Score: "..score, displayX1 - 100, 30, native.systemFont, 40)
	timerText:removeSelf()
	timerText = display.newText("Seconds: "..timerSec, 180, 30, native.systemFont, 40)
	livesText:removeSelf()
	livesText = display.newText("Lives: "..lives, displayX1 - 100, 80, native.systemFont, 40)
	end
end
local timer1 = timer.performWithDelay(100, resetStuff, 0)

function resetAfterCollision()
	if gameOverBoolean == false then
		if (star1Collision == true) then
			star1Collision = false
			star1.x = ranX1
			star1.y = ranY1
			star1.alpha = 1
			star1:setLinearVelocity(0,velO)
			score = score + 1
		elseif (star2Collision == true) then
			star2Collision = false
			star2.x = ranX2
			star2.y = ranY2
			star2.alpha = 1
			star2:setLinearVelocity(0,velO)
			score = score + 1
		elseif (star3Collision == true) then
			star3Collision = false
			star3.x = ranX3
			star3.y = ranY3
			star3.alpha = 1
			star3:setLinearVelocity(0,velO)
			score = score + 1
		elseif (star4Collision == true) then
			star4Collision = false
			star4.x = ranX4
			star4.y = ranY4
			star4.alpha = 1
			star4:setLinearVelocity(0,velO)
			score = score + 1
		elseif (star5Collision == true) then
			star5Collision = false
			star5.x = ranX5
			star5.y = ranY5
			star5.alpha = 1
			star5:setLinearVelocity(0,velO)
			score = score + 1
		elseif (star6Collision == true) then
			star6Collision = false
			star6.x = ranX6
			star6.y = ranY6
			star6.alpha = 1
			star6:setLinearVelocity(0,velO)
			score = score + 1
		elseif(asteroid1Collision == true) then
			asteroid1Collision = false
			asteroid1.x = ranX7
			asteroid1.y = ranY7
			asteroid1:setLinearVelocity(0,velO)
			asteroid1.alpha = 1
			lives = lives - 1
		elseif(asteroid2Collision == true) then
			asteroid2Collision = false
			asteroid2.x = ranX8
			asteroid2.y = ranY8
			asteroid2:setLinearVelocity(0,velO)
			asteroid2.alpha = 1
			lives = lives - 1
		elseif(asteroid3Collision == true) then
			asteroid3Collision = false
			asteroid3.x = ranX9
			asteroid3.y = ranY9
			asteroid3:setLinearVelocity(0,velO)
			asteroid3.alpha = 1
			lives = lives - 1
		elseif(asteroid4Collision == true) then
			asteroidCollision = false
			asteroid4.x = ranX10
			asteroid4.y = ranY10
			asteroid4:setLinearVelocity(0, velO)
			asteroid4.alpha = 1
			lives = lives - 1
		elseif(asteroid5Collision == true) then
			asteroid5Collision = false
			asteroid5.x = ranX11
			asteroid5.y = ranY11
			asteroid5:setLinearVelocity(0,velO)
			asteroid5.alpha = 1
			lives = lives - 1
		elseif(asteroid6Collision == true) then
			asteroid6Collision = false
			asteroid6.x = ranX12
			asteroid6.y = ranY12
			asteroid6:setLinearVelocity(0,velO)
			asteroid6.alpha = 1
			lives = lives - 1
		elseif(asteroid7Collision == true) then
			asteroid7Collision = false
			asteroid7.x = ranX13
			asteroid7.y = ranY13
			asteroid7:setLinearVelocity(0,velO)
			asteroid7.alpha = 1
			lives = lives - 1
		elseif(asteroid8Collision == true) then
			asteroid8Collision = false
			asteroid8.x = ranX14
			asteroid8.y = ranY14
			asteroid8:setLinearVelocity(0,velO)
			asteroid8.alpha = 1
			lives = lives - 1
		end
	end
end

local resetAfterCollisionTimer = timer.performWithDelay(100, resetAfterCollision, 0)

function handlerEnterFrameRight(event)
	if(movingRight == true) then
		moveRight()
	end
end
Runtime:addEventListener("enterFrame", handlerEnterFrameRight)

--function to move rocket ship right
function moveRight()
	if (rocketShip.x < displayX1 - 70) then
		rocketShip.x  = rocketShip.x + 24
		if (lives < 1) then
			gameisOver()
			gameOverBoolean = true
		end
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
	if rocketShip.x > 70 then
		rocketShip.x  = rocketShip.x - 24
		if (lives < 1) then
			gameisOver()
			gameOverBoolean = true
		end
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

local function onCollision(event)
	if ((event.object1.myName == "rocketship" and event.object2.myName == "star 1") or (event.object1.myName == "star 1" and event.object2.myName == "rocketship")) then
		transition.to(star1, {alpha=0, timer=10})
		star1Collision = true
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "star 2") or (event.object1.myName == "star 2" and event.object2.myName == "rocketship")) then
		transition.to(star2, {alpha=0, timer=10})
		star2Collision = true
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "star 3") or (event.object1.myName == "star 3" and event.object2.myName == "rocketship")) then
		transition.to(star3, {alpha=0, timer=10})
		star3Collision = true
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "star 4") or (event.object1.myName == "star 4" and event.object2.myName == "rocketship")) then
		transition.to(star4, {alpha=0, timer=10})
		star4Collision = true
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "star 5") or (event.object1.myName == "star 5" and event.object2.myName == "rocketship")) then
		transition.to(star5, {alpha=0, timer=10})
		star5Collision = true
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "star 6") or (event.object1.myName == "star 6" and event.object2.myName == "rocketship")) then
		transition.to(star6, {alpha=0, timer=10})
		star6Collision = true
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "asteroid 1") or (event.object1.myName == "asteroid 1" and event.object2.myName == "rocketship")) then
		if(lives > 0) then
			transition.to(asteroid1, {alpha=0, timer=10})
			asteroid1Collision = true
		else
			gameisOver()
			gameOverBoolean = true
		end
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "asteroid 2") or (event.object1.myName == "asteroid 2" and event.object2.myName == "rocketship")) then
		if(lives > 0) then
			transition.to(asteroid2, {alpha=0, timer=10})
			asteroid2Collision = true
		else
			gameisOver()
			gameOverBoolean = true
		end
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "asteroid 3") or (event.object1.myName == "asteroid 3" and event.object2.myName == "rocketship")) then
		if(lives > 0) then
			transition.to(asteroid3, {alpha=0, timer=10})
			asteroid3Collision = true
		else
			gameisOver()
			gameOverBoolean = true
		end
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "asteroid 4") or (event.object1.myName == "asteroid 4" and event.object2.myName == "rocketship")) then
		if(lives > 0) then
			transition.to(asteroid4, {alpha=0, timer=10})
			asteroid4Collision = true
		else
			gameisOver()
			gameOverBoolean = true
		end
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
		elseif((event.object1.myName == "rocketship" and event.object2.myName == "asteroid 5") or (event.object1.myName == "asteroid 5" and event.object2.myName == "rocketship")) then
		if(lives > 0) then
			transition.to(asteroid5, {alpha=0, timer=10})
			asteroid5Collision = true
		else
			gameisOver()
			gameOverBoolean = true
		end
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "asteroid 6") or (event.object1.myName == "asteroid 6" and event.object2.myName == "rocketship")) then
		if(lives > 0) then
			transition.to(asteroid6, {alpha=0, timer=10})
			asteroid6Collision = true
		else
			gameisOver()
			gameOverBoolean = true
		end
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "asteroid 7") or (event.object1.myName == "asteroid 7" and event.object2.myName == "rocketship")) then
		if(lives > 0) then
			transition.to(asteroid7, {alpha=0, timer=10})
			asteroid7Collision = true
		else
			gameisOver()
			gameOverBoolean = true
		end
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif((event.object1.myName == "rocketship" and event.object2.myName == "asteroid 8") or (event.object1.myName == "asteroid 8" and event.object2.myName == "rocketship")) then
		if(lives > 0) then
			transition.to(asteroid8, {alpha=0, timer=10})
			asteroid8Collision = true
		else
			gameisOver()
			gameOverBoolean = true
		end
		print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	elseif(event.object1.myName ~= "rocketship" and event.object2.myName ~= "rocketship") then
		eventObjectCollision = true
		if (event.object1.myName == "star 1" or event.object2.myName ==  "star 1") then
			star1Collision = true
			star1.alpha = 0
		elseif (event.object1.myName == "star 2" or event.object2.myName == "star 2") then
			star2Collision = true
			star2.alpha = 0
		elseif (event.object1.myName == "star 3" or event.object2.myName == "star 3") then
			star3Collision = true
			star3.alpha = 0
		elseif (event.object1.myName == "star 4" or event.object2.myName == "star 4") then
			star4Collision = true
			star4.alpha = 0
		elseif (event.object1.myName == "star 5" or event.object2.myName == "star 5") then
			star5Collision = true
			star5.alpha = 0
		elseif (event.object1.myName == "star 6" or event.object2.myName == "star 6") then
			star6Collision = true
			star6.alpha = 0
		elseif (event.object1.myName == "asteroid 1" or event.object2.myName == "asteroid 1") then
			asteroid1Collision = true
			asteroid1.alpha = 0
		elseif (event.object1.myName == "asteroid 2" or event.object2.myName == "asteroid 2") then
			asteroid2Collision = true
			asteroid2.alpha = 0
		elseif (event.object1.myName == "asteroid 3" or event.object2.myName == "asteroid 3") then
			asteroid3Collision = true
			asteroid3.alpha = 0
		elseif (event.object1.myName == "asteroid 4" or event.object2.myName == "asteroid 4") then
			asteroid4Collision = true
			asteroid4.alpha = 0
		elseif (event.object1.myName == "asteroid 5" or event.object2.myName == "asteroid 5") then
			asteroid5Collision = true
			asteroid5.alpha = 0
		elseif (event.object1.myName == "asteroid 6" or event.object2.myName == "asteroid 6") then
			asteroid6Collision = true
			asteroid6.alpha = 0
		elseif (event.object1.myName == "asteroid 7" or event.object2.myName == "asteroid 7") then
			asteroid7Collision = true
			asteroid7.alpha = 0
		elseif (event.object1.myName == "asteroid 8" or event.object2.myName == "asteroid 8") then
			asteroid8Collision = true
			asteroid8.alpha = 0
		end
		--print("first object: "..event.object1.myName.." second object: "..event.object2.myName)
	end
	--print("onCollision")
end

function gameisOver()
		gameGroup.alpha = 0
		gameOverGroup.alpha = 1
		rocketShip.x = -10
		rocketShip.y = displayY2 + 100
		scoreText:setFillColor(0,0,0)
		livesText:setFillColor(0,0,0)
		timerText:setFillColor(0,0,0)
		star1.y = displayY1
		star2.y = displayY1
		star3.y = displayY1
		star4.y = displayY1
		star5.y = displayY1
		star6.y = displayY1
		asteroid1.y = displayY1
		asteroid2.y = displayY1
		asteroid3.y = displayY1
		asteroid4.y = displayY1
		asteroid5.y = displayY1
		asteroid6.y = displayY1
		asteroid7.y = displayY1
		asteroid8.y = displayY1
		gameOverText:removeSelf()
		gameOverText = display.newText("Game Over, Your Score: "..score, displayX2, displayY2 - 100, native.systemFont, 48)
		gameOverGroup:insert(gameOverText)
		gameOverText2:removeSelf()
		gameOverText2 = display.newText("Click Here To Play Again", displayX2, displayY2, native.systemFont, 48)
		gameOverGroup:insert(gameOverText2)
		resetButton.alpha = 1
		resetButtonText:removeSelf()
		resetButtonText = display.newText("Reset Game", displayX2, displayY2 + 120, native.systemFont, 48)
		resetButtonText:setFillColor(0,0,0)
		gameOverGroup:insert(resetButtonText)
end

--reset booleans
function resetBooleans()
	gameOverBoolean = false
	star1Collision = false
	star2Collision = false
	star3Collision = false
	star4Collision = false
	star5Collision = false
	star6Collision = false
	asteroid1Collision = false
	asteroid2Collision = false
	asteroid3Collision = false
	asteroid4Collision = false
	asteroid5Collision = false
	asteroid6Collision = false
	asteroid7Collision = false
	asteroid8Collision = false
	movingLeft = false
	movingRight = false
end

function resetGame()
	--put information in to reset game
	gameOverGroup.alpha = 0
	gameGroup.alpha = 1
	rocketShip.x = displayX2
	star1.x = ranX1
	star1.y = ranY1
	star2.x = ranX2
	star2.y = ranY2
	star3.x = ranX3
	star3.y = ranY3
	star4.x = ranX4
	star4.y = ranY4
	star5.x = ranX5
	star5.y = ranY5
	star6.x = ranX6
	star6.y = ranY6
	asteroid1.x = ranX7
	asteroid1.y = ranY7
	asteroid2.x = ranX8
	asteroid2.y = ranY8
	asteroid3.x = ranX9
	asteroid3.y = ranY9
	asteroid4.x = ranX10
	asteroid4.y = ranY10
	asteroid5.x = ranX11
	asteroid5.y = ranY11
	asteroid6.x = ranX12
	asteroid6.y = ranY12
	asteroid7.x = ranX13
	asteroid7.y = ranY13
	asteroid8.x = ranX14
	asteroid8.y = ranY14
	--set linear velocity of all objects
	star1:setLinearVelocity(0, velO)
	star2:setLinearVelocity(0, velO)
	star3:setLinearVelocity(0, velO)
	star4:setLinearVelocity(0, velO)
	star5:setLinearVelocity(0, velO)
	star6:setLinearVelocity(0, velO)
	asteroid1:setLinearVelocity(0, velO)
	asteroid2:setLinearVelocity(0, velO)
	asteroid3:setLinearVelocity(0, velO)
	asteroid4:setLinearVelocity(0, velO)
	asteroid5:setLinearVelocity(0, velO)
	asteroid6:setLinearVelocity(0, velO)
	asteroid7:setLinearVelocity(0, velO)
	asteroid8:setLinearVelocity(0, velO)
	lives = 6
	score = 0
	timerSec = 0
	resetBooleans()
end
resetButton:addEventListener("touch", resetGame)
Runtime:addEventListener("collision", onCollision)