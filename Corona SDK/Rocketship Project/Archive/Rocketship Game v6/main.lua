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
local randomXAsteroid = math.random(0, Width)
local randomYAsteroid = math.random(-100, -30)
local randomXStar = math.random(0,Width)
local randomYStar = math.random(-40, -10)
local maxVelocity = 12
local randomVelocity = math.random(4, maxVelocity)
local asteroidCollision = false
local starCollision = false
local asteroid = {}
local star = {}
local timerValueAsteroid = 1750
local timerValueStars = 1400



--scoring and groups
local score = 0
local health = 3

--Background
local background = display.newImage("background.jpg", halfWidth, halfHeight)
background.width = Width
background.height = Height

--Bar off the screen that would come into contact with objects that did not interact with the rocketship
local bar = display.newImage("background.jpg", halfWidth, Height + 100)
bar.width = Width * 32
bar.height = 1
physics.addBody(bar, "kinematic", {density = 0, friction = 0})
bar.myName = "bar"


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

--randomize random numbers
local function randomizeNumbers()
	randomXStar = math.random(0,Width)
	randomYStar = math.random(-100, -40)
	randomXAsteroid = math.random(0, Width)
	randomYAsteroid = math.random(-400, -200)
end

timer.performWithDelay(500, randomizeNumbers, 0)


local numAsteroids = 1

--Spawn Asteroids
local function loadAsteroid()
--	numAsteroids = numAsteroids + 1
	for i=1,numAsteroids do
		asteroid[numAsteroids] = display.newImage("asteroid.png")
		asteroid[numAsteroids].x = randomXAsteroid
		asteroid[numAsteroids].y = randomYAsteroid
		physics.addBody(asteroid[numAsteroids], {density = 2, bounce = .1, radius = 44})
		asteroid[numAsteroids].myName = "asteroid"
		asteroid[numAsteroids]:setLinearVelocity(0, randomVelocity)
	end
end

function spawnMoreAsteroids()
	numAsteroids = numAsteroids + 1
	timerValue = timerValue + 500
end

timer.performWithDelay (timerValueAsteroid, loadAsteroid, 0)
timer.performWithDelay (900000, spawnMoreAsteroids, 1)


local numStars = 1

--Spawn Stars
local function loadStars()
	for i=1,numStars do
		star[numStars] = display.newImage("Star.png")
		star[numStars].x = randomXStar
		star[numStars].y = randomYStar
		physics.addBody(star[numStars], {density = .4, bounce = .1, radius = 13})
		star[numStars].myName = "star"
		star[numStars]:setLinearVelocity(0, randomVelocity)
	end
end


function spawnMoreStars()
	numStars = numStars + 1
	timerValueStars = timerValueStars + 150
end

timer.performWithDelay (timerValueStars, loadStars, 0)
timer.performWithDelay (99900, spawnMoreStars, 1)




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
	if (event.object1.myName == "rocketShip" and event.object2.myName == "asteroid") then
		--[[print("first object: "..event.object1.myName)
		print(" second object: "..event.object2.myName)]]
		asteroidCollision = true
		transition.to(event.object2, {alpha=0, timer=1})
		event.object2:removeSelf()
	elseif (event.object1.myName == "rocketShip" and event.object2.myName == "star") then
		--[[print("first object: "..event.object1.myName)
		print(" second object: "..event.object2.myName)]]
		starCollision = true
		transition.to(event.object2, {alpha=0, timer=1})
		event.object2:removeSelf()
	elseif (event.object1.myName == "bar") then
		--[[print("bar hit")
		print("deleted"..event.object2.myName)]]
		event.object2:removeSelf()
	end
end



Runtime:addEventListener("collision", onCollision)



local function resetTimerFunction()
	--update text on screen
		scoreText:removeSelf()
		healthText:removeSelf()
		scoreText = display.newText("Score: "..score, Width - Width/2, 20, native.systemFont, 26)
		healthText = display.newText("Health: "..health, Width - Width/8, 20, native.systemFont, 26)

	if (asteroidCollision == true) then
		--deleting asteroid
		asteroidCollision = false
	    health = health - 1
	elseif(starCollision == true) then
		--resetting star position after a collision
		starCollision = false
		score = score + 1
	end

	if(health > 1) then
		maxVelocity = maxVelocity + .01
	end
end

timer.performWithDelay(50, resetTimerFunction, 0)



