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
physics.setGravity(0, 1.25555)


local Width = display.contentWidth
local halfWidth = display.contentWidth/2
local Height = display.contentHeight
local halfHeight = display.contentHeight/2
local rectW = Width/2
local rectH = Height/3
local randomX = math.random(0, Width)
local randomY = math.random(-500, -100)
local randomVelocity = math.random(4, 12)
local asteroidCollision = false
local starCollision = false



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
rocketShip.myName = "rocketShip"
rocketShip.x = halfWidth
rocketShip.y = halfHeight + halfHeight/1.6
rocketShip:play()

--Physics for rocket ship
physics.addBody(rocketShip, "kinematic", {density = 1, friction = 0, bounce = 0})
--rocketShip.isBullet = true


--Graphics of asteroid
local sheet2 = graphics.newImageSheet("asteroid.png", {width = 96, height = 96, numFrames = 1})
local asteroid = display.newSprite(sheet2, {name = "asteroid", start = 1, count = 1, time = 200})
asteroid.myName = "asteroid"
asteroid.x = halfWidth
asteroid.y = randomY
asteroid:play()

--Physics for asteroid
physics.addBody(asteroid, "dynamic", {density = 2, friction = 0, bounce = .4, radius = 44})


--Graphics of star
local sheet3 = graphics.newImageSheet("Star.png", {width = 32, height = 32, numFrames = 1})
local star = display.newSprite(sheet3, {name = "star", start = 1, count = 1, time = 200})
star.myName = "star"
star.x = randomX
star.y = randomY
star:play()

--Physics for star
physics.addBody(star, "dynamic", {density = 1, bounce = 8, radius = 13})



--initializing right and left buttons
local rightRect = display.newRect(Width - rectW/4 , Height - rectH/2, rectW, rectH)
rightRect.alpha = .01
local rightText = display.newText("Move Right", Width - rectW/4, Height - rectH/2, native.systemFont, 30)
rightRect:setFillColor(0,0,0)
rightText.alpha = .6

local leftRect = display.newRect(rectW/4, Height - rectH/2, rectW, rectH)
leftRect.alpha = .01
local leftText = display.newText("Move Left", rectW/4,  Height - rectH/2, native.systemFont, 30)
leftRect:setFillColor(0,0,0)
leftText.alpha = .6


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
		rightText.alpha = .15
		leftText.alpha = .15
	elseif(event.phase == "ended" and movingRight==true)then
		--stop moving right
		moveRight()
		movingRight = false
		rightText.alpha = .3
		leftText.alpha = .3
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
		rightText.alpha = .15
		leftText.alpha = .15
	elseif(event.phase == "ended" and movingLeft == true)then
		--stop moving left
		moveLeft()
		movingLeft = false
		rightText.alpha = .3
		leftText.alpha = .3
	end
	return true
end
leftRect:addEventListener("touch", handleleftButton)


--Collisions
local function onCollision(event)
	if (event.object1.myName == "rocketShip" and event.object2.myName == "asteroid") or (event.object1.myName == "asteroid" and event.object2.myName == "rocketShip") then
		print("first object: "..event.object1.myName)
		print(" second object: "..event.object2.myName)
		asteroidCollision = true
		transition.to(asteroid, {alpha=0, timer=1})
	elseif (event.object1.myName == "rocketShip" and event.object2.myName == "star") or (event.object1.myName == "star" and event.object2.myName == "rocketShip") then
		print("first object: "..event.object1.myName)
		print(" second object: "..event.object2.myName)
		starCollision = true
		transition.to(star, {alpha=0, timer=1})
	end
end



Runtime:addEventListener("collision", onCollision)


--[[ Local collision handling
local function onLocalCollision( self, event )
    print( event.target )        --the first object in the collision
    print( event.other )         --the second object in the collision
    print( event.selfElement )   --the element (number) of the first object which was hit in the collision
    print( event.otherElement )  --the element (number) of the second object which was hit in the collision

end
rocketShip.collision = onLocalCollision
rocketShip:addEventListener( "collision", rocketShip )]]


function resetTimerFunction()
	--change x, y, and velocity
	    randomX = math.random(0, Width)
		randomY = math.random(-500, -100)
		randomVelocity = math.random(.1, 20)

	--update text on screen
		scoreText:removeSelf()
		healthText:removeSelf()
		scoreText = display.newText("Score: "..score, Width - Width/2, 20, native.systemFont, 26)
		healthText = display.newText("Health: "..health, Width - Width/8, 20, native.systemFont, 26)

	if (asteroidCollision == true) then
		--resetting asteroid position after a collision
		transition.to(asteroid, {alpha = 1, timer=10})
		asteroidCollision = false
		asteroid.x = randomX
		asteroid.y = randomY
		asteroid:setLinearVelocity(0, randomVelocity)
	    health = health - .5

	elseif(starCollision == true) then
		--resetting star position after a collision
		transition.to(star, {alpha = 1, timer=10})
		starCollision = false
		star.x = halfWidth
		star.y = randomY
		star:setLinearVelocity(0, randomVelocity)
		score = score + .5
	elseif(star.y > Height + star.height) then
		star.y = randomY
		star.x = randomX
		star:setLinearVelocity(0, randomVelocity)
	elseif(asteroid.y > Height + asteroid.height) then
		asteroid.y = randomY
		asteroid.x = randomX
		asteroid:setLinearVelocity(0, randomVelocity)
	end
end

--timer for resetting x,y
local timer1 = timer.performWithDelay(50, resetTimerFunction, 0)
