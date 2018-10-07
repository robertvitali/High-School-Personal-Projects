-----------------------------------------------------------------------------------------
--
-- main.lua 
-- 4/3/16
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar(display.HiddenStatusBar)
system.activate("multitouch")
local composer = require "composer"
local scene = composer.newScene()

function scene:create (event)
	playScreenGroup = self.view

	local physics = require("physics")
	physics.start(true)
	physics.setGravity(0, 1.25555)


	Width = display.contentWidth
	halfWidth = display.contentWidth/2
	Height = display.contentHeight
	halfHeight = display.contentHeight/2
	rectW = Width/2
	rectH = Height/3
	local randomXAsteroid = math.random(0, Width)
	local randomYAsteroid = math.random(-100, -30)
	local randomXStar = math.random(0,Width)
	local randomYStar = math.random(-40, -10)
	local maxVelocity = 12
	local randomVelocity = math.random(4, maxVelocity)
	local starCollision = false
	asteroid = {}
	star = {}
	local timerValueAsteroid = 1150
	local timerValueStars = 1000



	--scoring and groups
	score = 0
	health = 3

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
	scoreText = display.newText("Score: "..score, Width - Width/2, 20, native.systemFont, 26)

	--show health
	healthText = display.newText("Health: "..health, Width - Width/8, 20, native.systemFont, 26)



	--Graphics of rocket ship
	local sheet1 = graphics.newImageSheet("rocketShip.png", {width = 64, height = 64, numFrames = 17})
	rocketShip = display.newSprite(sheet1, {name = "rocketShip", start = 1, count = 17, time = 200})
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

	timer.performWithDelay(100, randomizeNumbers, 0)


	numAsteroids = 1

	--Spawn Asteroids
	local function loadAsteroid()
		for i=1,numAsteroids do
			if(health > 1) then
				asteroid[numAsteroids] = display.newImage("asteroid.png")
				asteroid[numAsteroids].x = randomXAsteroid
				asteroid[numAsteroids].y = randomYAsteroid
				physics.addBody(asteroid[numAsteroids], {density = 2, bounce = .1, radius = 44})
				asteroid[numAsteroids].myName = "asteroid"
				asteroid[numAsteroids]:setLinearVelocity(0, randomVelocity)
			end
		end
	end

	function spawnMoreAsteroids()
		numAsteroids = numAsteroids + 1
		timerValueAsteroid = timerValueAsteroid + 500
	end

	asteroidTimer1 = timer.performWithDelay (timerValueAsteroid, loadAsteroid, 0)
	asteroidTimer2 = timer.performWithDelay (12000, spawnMoreAsteroids, 0)


	numStars = 1

	--Spawn Stars
	local function loadStars()
		for i=1,numStars do
			if(health > 1) then
				print("loadstars")
				star[numStars] = display.newImage("Star.png")
				star[numStars].x = randomXStar
				star[numStars].y = randomYStar
				physics.addBody(star[numStars], {density = .4, bounce = .1, radius = 13})
				star[numStars].myName = "star"
				star[numStars]:setLinearVelocity(0, randomVelocity)
			end
		end
	end


	function spawnMoreStars()
		numStars = numStars + 1
		timerValueStars = timerValueStars + 150
	end

	starTimer1 = timer.performWithDelay (timerValueStars, loadStars, 0)
	starTimer2 = timer.performWithDelay (9900, spawnMoreStars, 0)


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
			transition.to(event.object2, {alpha=0, timer=1})
			event.object2:removeSelf()
			health = health - 1
		elseif (event.object1.myName == "rocketShip" and event.object2.myName == "star") then
			starCollision = true
			transition.to(event.object2, {alpha=0, timer=1})
			event.object2:removeSelf()
			score = score + 1
		elseif (event.object1.myName == "bar") then
			event.object2:removeSelf()
		end

		if(health > 0)then
		--update text on screen
			scoreText:removeSelf()
			healthText:removeSelf()
			scoreText = display.newText("Score: "..score, Width - Width/2, 20, native.systemFont, 26)
			healthText = display.newText("Health: "..health, Width - Width/8, 20, native.systemFont, 26)
			maxVelocity = maxVelocity + .05
		end
	end


	Runtime:addEventListener("collision", onCollision)


	playScreenGroup:insert(background)
	playScreenGroup:insert(bar)
	playScreenGroup:insert(rocketShip)
	playScreenGroup:insert(rightRect)
	playScreenGroup:insert(rightText)
	playScreenGroup:insert(leftRect)
	playScreenGroup:insert(leftText)
	playScreenGroup:insert(scoreText)
	playScreenGroup:insert(healthText)

	playScreenGroup.alpha = 1

	local function switchScene (event)
	if(health < 1) then
		scoreText.alpha = 0
		healthText.alpha = 0
		playScreenGroup.alpha = 0
		composer.gotoScene("restart")
		composer.removeScene("gamePlay")
		timer.pause(starTimer1)
		timer.pause(starTimer2)
		timer.pause(asteroidTimer1)
		timer.pause(asteroidTimer2)
	end
end

Runtime:addEventListener("collision", switchScene)

end

function scene:show(event)
	
end

function scene:hide(event)
	
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene


