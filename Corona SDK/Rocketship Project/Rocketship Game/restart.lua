-- RESTART PAGE
--4/12/16

display.setStatusBar(display.HiddenStatusBar)
local composer = require "composer"
local scene = composer.newScene()

function scene:create (event)
	restartScreen = self.view

	local whiteRectangle = display.newRect(restartScreen, display.contentWidth/2, display.contentHeight/2, display.contentWidth*2, display.contentHeight*2)
	whiteRectangle:setFillColor(0,0,0)

	restartButton = display.newImage("restart.png")
	restartButton.x = display.contentWidth/2
	restartButton.y = display.contentHeight/2 + 80
	restartButton.width = 64
	restartButton.height = 64


	restartScreen:insert(restartButton)
	--restartScreen:insert(Text)

	--THIS BUTTON TO GO BACK TO THE GAME
	local function restartButtonFunction(event)
		restartScreen.alpha = 0
		restartScreen:removeSelf()
		composer.gotoScene("gamePlay")
		score = 0
		health = 1
		maxVelocity = 12
		rocketShip.x = display.contentWidth/2
		numAsteroids = 1
		numStars = 1
		movingLeft = false
		movingRight = false
		asteroid = {}
		star = {}
		timer.resume(asteroidTimer1)
		timer.resume(asteroidTimer2)
		timer.resume(starTimer1)
		timer.resume(starTimer2)
	end

	restartButton:addEventListener("tap", restartButtonFunction)

end

function scene:show(event)
	
end

function scene:hide(event)
	
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)

return scene



